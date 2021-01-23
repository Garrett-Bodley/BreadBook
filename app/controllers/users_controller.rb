class UsersController < ApplicationController

  def new
    @current_user = User.new
  end

  def create
    @current_user = User.new(user_params)
    if @current_user.save
      session[:user_id] = @current_user.id
      redirect_to @current_user
    else
      render :new, alert: "Invalid input(s) recieved."
    end
  end

  def show
    current_user
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
