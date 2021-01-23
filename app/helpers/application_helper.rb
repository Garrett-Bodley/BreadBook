module ApplicationHelper

  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def permission_check
    redirect_to '/login', alert: "You must be logged in to view that page." unless logged_in?
  end
  
end
