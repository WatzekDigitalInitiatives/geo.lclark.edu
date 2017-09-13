class CallbacksController < Devise::OmniauthCallbacksController

  # Google OAuth2.0 method to receive data about user after they authenticate
  # using their lclark account
  def google_oauth2
    unless request.env["omniauth.auth"].info.email.split("@").last == "lclark.edu"
      redirect_to '/', alert: 'Please use your lclark email to sign in.'
      return
    end
    @user = User.from_omniauth(request.env["omniauth.auth"])
    sign_in_and_redirect @user
  end
end
