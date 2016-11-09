class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :billable_hours

  def billable_hours
    @total_billable_hours = Task.billable_hours(current_user, true)
  end
end
