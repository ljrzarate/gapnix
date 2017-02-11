class TasksController < ApplicationController
  
  add_breadcrumb I18n.t("tasks.title"), :tasks_path

  def index
    @tasks = Task.weekly_current_task(current_user).paginate(page: params[:page])
    @categories = current_user.categories
    @projects = current_user.projects
    @task = current_user.tasks.new
    @task_time = @task.task_times.new
  end

  def create    
    init_time_tasks_params
    @task = current_user.tasks.new(task_params)
    if @task.save
      flash[:notice] = I18n.t("tasks.created")
    else
      flash[:alert] = @task.errors.full_messages.to_sentence
    end
    redirect_to tasks_path
  end

  def edit
    @task = current_user.tasks.find(params[:id])
    @categories = current_user.categories
    @projects = current_user.projects
    add_breadcrumb I18n.t("edit"), :edit_task_path
  end

  def update
    @taks = current_user.tasks.find(params[:id])
    @taks.attributes = task_params      
    if @taks.valid?
      @taks.save
      flash[:notice] = I18n.t("tasks.updated")
      redirect_to tasks_path
    else
      flash[:alert] = @taks.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if current_user.tasks.find(params[:id]).destroy
      flash[:notice] = I18n.t("tasks.deleted")
      redirect_to tasks_path            
    else
      flash[:alert] = task.errors.full_messages.to_sentence      
    end
  end

  private 
  def task_params
    params.require(:task).permit(:description, :billable, :category_id, :project_id, task_times_attributes: [:hours, :start_date])
  end

  def init_time_tasks_params
    p = params[:task][:task_times_attributes]['0']
    p[:start_date] = DateTime.current
    p[:is_active] = true
  end
end
