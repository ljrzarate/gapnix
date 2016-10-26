class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @categories = Category.all
    @projects = Project.all
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "Task created!"
      redirect_to tasks_path
    end
  end

  private 
    def task_params
      params.require(:task).permit(:description, :billable, :hours, :category_id, :project_id)
    end
end
