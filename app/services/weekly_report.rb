class WeeklyReport
  attr_reader :current_user
  def initialize (current_user)
    @current_user = current_user
  end

  def fetch
    Task.weekly_current_task(current_user)
  end

  def getTaskAndTaskTimes
    Task.get_current_week_tasks_taskTimes (current_user)
  end
end