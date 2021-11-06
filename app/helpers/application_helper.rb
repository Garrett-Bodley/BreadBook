module ApplicationHelper

  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
    session[:user_id] = nil
    redirect_to root_path
  end

  def logged_in?
    !!current_user
  end

  def please_log_in
    unless logged_in?
      redirect_to '/login', alert: "You must be logged in to view that page."
    end
  end
  
end
