class TaskTimeService
  attr_reader :user
  def initialize (user)
    @user = user
  end

  def createTask(params)
    if true # validate here if the task already exists for this week
      ActiveRecord::Base.transaction do
        task = current_user.tasks.new(params)
        if @task.save
          startTask(task.id, params.startDate)
        else
          #implement
        end
      end
    end
  end

  def startTask(task_id, start_date)
    ActiveRecord::Base.transaction do
      TaskTimes.where("task_id = ?", task_id).update_all(is_active: false)
      @existing_task = TaskTime.where("task_id = ? AND start_date::date = ?", task_id, start_date.to_date)

    end
  end
end