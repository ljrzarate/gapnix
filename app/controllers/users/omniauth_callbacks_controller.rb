class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    
    if @user && @user.persisted?
      flash[:notice] = I18n.t "home_title", :kind => "Google"
      sign_in(:user, @user, { bypass: true })
      redirect_to dashboard_path
    else
      session["devise.google_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to root_path
      flash[:error] = "Lo sentimos, no aceptamos dirección de correo electrónico con dominio diferente a GrowthAccelerationPartner, por favor intenta con una dirección asociada  a GAP."
    end
  end
end