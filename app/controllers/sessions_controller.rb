class SessionsController < ApplicationController
  layout false
 
  def new
    if current_user 
      redirect_to dashboard_path
    end
  end

end