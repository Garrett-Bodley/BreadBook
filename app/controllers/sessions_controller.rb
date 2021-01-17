class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: user_params[:name])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:alert] = "Incorrect input(s) provided"
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
  
end
