class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_signin
    unless signed_in?
      redirect_to signin_path
      return false
    end
  end

  def signed_in?
    !current_user.nil?
  end

  def signin(user)
    session[:user_id] = user.id
    cookies.signed[:secure_user_id] = { value: secure_value(user.id) }
  end

  # cf. http://railscasts.com/episodes/356-dangers-of-session-hijacking
  def current_user
    if cookies.signed[:secure_user_id] == secure_value(session[:user_id])
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end

  def secure_value(val)
    "#{val} is protected ;)"
  end
end
