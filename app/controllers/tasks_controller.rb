class TasksController < ApplicationController
  
  add_breadcrumb I18n.t("tasks.title"), :tasks_path

  def index
    @tasks = Task.weekly_current_task(current_user).paginate(page: params[:page])
    @categories = current_user.categories
    @projects = current_user.projects     
  end

  def create
    binding.pry
    @task = current_user.tasks.new(task_params)
    if @task.save
      flash[:notice] = "Task created!"      
    else
      flash[:alert] = @task.errors.full_messages.to_sentence
    end
    redirect_to tasks_path
  end

  private 
  def task_params
    params.require(:task).permit(:description, :billable, :hours, :category_id, :project_id)
  end
end
