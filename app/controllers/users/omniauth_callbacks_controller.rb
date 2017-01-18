class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    
    if @user && @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in(:user, @user, { bypass: true })
      redirect_to dashboard_path
    else
      session["devise.google_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to root_path
      flash[:error] = I18n.t("auth.email_not_authorized")
    end
  end
end