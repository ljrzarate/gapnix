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
          startTask()
        else
          #implement
        end
      end
    end
  end

  def startTask(startDate)
    
  end
end