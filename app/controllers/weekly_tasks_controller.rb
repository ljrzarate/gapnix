class WeeklyTasksController < ApplicationController
  def index
    @tasks = Task.for_user_in_this_week(current_user)        
  end
end