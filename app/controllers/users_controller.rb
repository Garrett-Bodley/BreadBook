class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    byebug
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new, alert: "Invalid input(s) recieved."
    end
  end

  def show
    @user = User.find(session[:user_id])
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
