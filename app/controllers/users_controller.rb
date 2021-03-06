class UsersController < ApplicationController
  before_action :please_log_in, only: [:update]

  def new
    @current_user = User.new
  end

  def create
    @current_user = User.new(user_params)
    if @current_user.save
      session[:user_id] = @current_user.id
      redirect_to @current_user
    else
      flash[:alert] = "Invalid input(s) recieved."
      render :new
    end
  end

  def update
    if current_user.authenticate(user_params[:old_password])
      current_user.update(password: user_params[:password], password_confirmation: user_params[:password_confirmation], name: user_params[:name])
      redirect_to current_user, alert: "Changes saved!"
    else
      redirect_to current_user, alert: "Something went wrong..."
    end
  end

  def show
    current_user
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :old_password)
  end

end
