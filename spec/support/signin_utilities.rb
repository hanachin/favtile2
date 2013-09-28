module SigninUtilities
  def set_user_session(user)
    session[:user_id] = user.id
    cookies.signed[:secure_user_id] = { secure: true, value: ApplicationController.new.secure_value(user.id) }
  end
end
