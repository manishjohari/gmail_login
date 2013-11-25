class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def google
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    #@user = User.find_for_google_oauth(request.env["omniauth.auth"], current_user) ## removed due to ActionDispatch::Cookies::CookieOverflow

    #request.env["omniauth.auth"].extra.raw_info.name,
    @user = User.find_for_google_oauth(request.env["omniauth.auth"].provider, request.env["omniauth.auth"].uid,  request.env["omniauth.auth"].info.email, current_user)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end