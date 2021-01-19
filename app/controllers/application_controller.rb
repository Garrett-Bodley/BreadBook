class ApplicationController < ActionController::Base

  before_action :current_user

  def cart
    @cart ||= session[:cart] || []
    session[:cart] ||= @cart
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
end
