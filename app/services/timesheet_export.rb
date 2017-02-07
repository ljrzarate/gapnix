class TimesheetExport
    attr_reader :current_user

    def initialize (current_user, task_ids)
        @current_user = current_user
        @tasks = current_user.tasks.find(task_ids) 
    end

   
end