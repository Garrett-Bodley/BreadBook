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

  def omniauth
    @current_user = User.find_or_create_by(provider: auth['provider'], uid: auth['uid']) do |u|
      u.name = auth['info']['nickname']
      u.password = SecureRandom.hex(32)
    end
    if @current_user.valid?
      session[:user_id] = @current_user.id
      redirect_to @current_user
    else
      redirect_to login_path, alert: "Something went wrong..."
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

  def auth
    request.env['omniauth.auth']
  end
  
end
