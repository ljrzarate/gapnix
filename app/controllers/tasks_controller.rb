class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @categories = Category.all
    @projects = Project.all
  end

  def create
    @task = Task.new(post_params)
    if task.save
      flash[:notice] = "Task created!"
    end
  end

  private 
    def post_params
      params.require(:task).permit(:name, :description, :category_id, :project_id)
    end
end
