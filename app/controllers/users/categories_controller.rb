class Users::CategoriesController < ApplicationController

    def index
        @categories = current_user.projects.find(params[:project_id]).categories
    end

    def new
        @category = Category.new
    end

    def create
        @category = current_user.projects.new(category_params)
        
        if @category.valid?
          @category.save
          flash.now[:notice] = "Category created!"
          redirect_to user_projects_path
        else
          flash[:alert] = @category.errors.full_messages.to_sentence
          render :new
        end
    end

    def edit
        @category = current_user.projects.find(params[:project_id]).categories.find(params[:id])
    end

    def update
        @category = current_user.projects.find(params[:project_id]).categories.find(params[:id])
        @category.attributes = category_params
        
        if @category.valid?
          @category.save
          flash.now[:notice] = "Category updated!"
          redirect_to user_projects_path
        else
          flash[:alert] = @category.errors.full_messages.to_sentence
          render :edit
        end
    end

    def destroy
        current_user.projects.find(params[:project_id]).categories.find(params[:id]).destroy
        flash[:success] = "Category deleted"
        redirect_to user_projects_path
    end

    private 
        def category_params
            params.require(:category).permit(:name, :description)
        end
end