class ApplicationController < ActionController::Base
  include ApplicationHelper

  before_action :current_user

  def cart
    @cart ||= session[:cart] || []
    session[:cart] ||= @cart
  end
  
end
