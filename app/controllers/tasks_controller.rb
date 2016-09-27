class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @categories = Category.all
    @projects = Project.all
  end

  def create
    @task = Task.new(post_params)
<<<<<<< 9a03a6a98cb81e90ebd485b869c5eb93965cefd9
    if task.save
      flash[:notice] = "Task created!"
    end
=======
      if task.save
          flash[:notice] = "Task created!"
      end
>>>>>>> Creatre controller for tasks, and the base index interface
  end

  private 
    def post_params
      params.require(:task).permit(:name, :description, :category_id, :project_id)
    end
end
