class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user

  def welcome
  end

  def guest
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless logged_in?
      flash[:alert] = "You must be logged in to view the page you requested."
      redirect_to root_path
    end
  end
end
