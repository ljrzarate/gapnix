# t = TimesheetExport.new(User.first, [1,3,4])
class TimesheetExport
    attr_reader :current_user, :tasks, :journyx_username, :journyx_password

    def initialize (options = {})
        @current_user = options.fetch(:current_user)
        @tasks = current_user.tasks.find(options.fetch(:task_ids))
        @journyx_username = options.fetch(:journyx_username) 
        @journyx_password = options.fetch(:journyx_password) 
    end


    def export
      ActiveRecord::Base.transaction do
        update_time_tasks
        send_to_journyx
      end
    end

    private
    def update_time_tasks
      tasks.each do |task|
        task.task_times.update_all(is_active: true)
      end
    end

    def send_to_journyx
      resp = []
      tasks.each do |task|
        task_hash = get_task_attributes(task)
        task_hash[:times]= get_task_times_attributes(task)
        resp << task_hash
      end
      resp
      Journyx::PublishMultipleTask.new(
        resp, 
        journyx_username, 
        journyx_password
      ).publish
    end

    def get_task_times_attributes(task)      
      task.task_times.map do |task_time|
        {
          hours: task_time.hours,
          wday: task_time.start_date.strftime("%A")
        }
      end
    end

    def get_task_attributes(task)
      {
        description: task.description,
        project: task.project_name,
        category: task.category_name
      }
    end
end