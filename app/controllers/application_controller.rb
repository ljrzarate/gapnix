class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :billable_hours

  add_breadcrumb I18n.t("home_title"), :root_path

  layout :layout_by_resource

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'new'
      "login"
    else
      "application"
    end
  end  

  def billable_hours
    @total_billable_hours = Task.billable_hours(current_user) if current_user
  end
end
