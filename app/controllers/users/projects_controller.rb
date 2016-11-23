class Users::ProjectsController < ApplicationController

    def index
        @projects = current_user.projects      
    end

    def new
        @project = Project.new
    end

    def create
        @project = current_user.projects.new(project_params)
        
        if @project.valid?
          @project.save
          flash.now[:notice] = "Project created!"
          redirect_to user_projects_path
        else
          flash[:alert] = @project.errors.full_messages.to_sentence
          render :new
        end
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update
        @project = Project.find(params[:id])
        @project.attributes = project_params
        
        if @project.valid?
          @project.save
          flash.now[:notice] = "Project updated!"
          redirect_to user_projects_path
        else
          flash[:alert] = @project.errors.full_messages.to_sentence
          render :edit
        end
    end

    def destroy
        Project.find(params[:id]).destroy
        flash[:success] = "Project deleted"
        redirect_to user_projects_path
    end

    private 
        def project_params
            params.require(:project).permit(:name, :description)
        end
end