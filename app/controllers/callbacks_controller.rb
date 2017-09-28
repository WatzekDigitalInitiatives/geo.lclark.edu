class CallbacksController < Devise::OmniauthCallbacksController

  # Google OAuth2.0 method to receive data about user after they authenticate
  # using their lclark account
  def google_oauth2
    unless request.env["omniauth.auth"].info.email.split("@").last == "lclark.edu"
      redirect_to '/', alert: 'Please use your lclark email to sign in.'
      return
    end
    @user = User.from_omniauth(request.env["omniauth.auth"])
    set_user_role @user
    sign_in_and_redirect @user
  end

  # Check admins file from project root and make user admin if listed there
  def set_user_role(user)
    admins_file = File.read(Rails.root.join('admins'))
    admins = admins_file.split("\n")
    if admins.include?(user.email)
      user.update_attribute :admin, true
    else
      user.update_attribute :admin, false
    end
  end

end
