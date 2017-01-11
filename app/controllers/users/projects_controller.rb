class Users::ProjectsController < ApplicationController

    # add_breadcrumb "Home", :root_path
    add_breadcrumb I18n.t("projects.title"), :user_projects_path

    def index
        @projects = current_user.projects.paginate(page: params[:page])
    end

    def new
        @project = Project.new
        add_breadcrumb I18n.t("projects.new"), :new_user_project_path
    end

    def create
        @project = current_user.projects.new(project_params)
        
        if @project.valid?
          @project.save
          flash[:notice] = "Project created!"
          redirect_to user_projects_path
        else
          flash[:alert] = @project.errors.full_messages.to_sentence
          render :new
        end
    end

    def edit
        @project = Project.find(params[:id])
        add_breadcrumb I18n.t("projects.edit"), :edit_user_project_path
    end

    def update
        @project = Project.find(params[:id])
        @project.attributes = project_params
        
        if @project.valid?
          @project.save
          flash[:notice] = "Project updated!"
          redirect_to user_projects_path
        else
          flash[:alert] = @project.errors.full_messages.to_sentence
          render :edit
        end
    end

    def destroy
        Project.find(params[:id]).destroy
        flash[:notice] = "Project deleted"
        redirect_to user_projects_path
    end

    private 
        def project_params
            params.require(:project).permit(:name, :description)
        end
end