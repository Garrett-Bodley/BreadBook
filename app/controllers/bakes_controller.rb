class BakesController < ApplicationController

  def new
    @user = User.find(session[:user_id])
    @bake = Bake.new
  end

  def create
    @bake = Bake.new(bake_params)
    if @bake.save
      redirect_to @bake
    else
      render :new, alert: "Invalid input(s) provided."
    end
  end

  def edit
  end

  def show
    @bake = Bake.find(params[:id])
  end

  def index
  end

  def destroy
  end
  
  private

  def bake_params
    params.require(:bake).permit(:date, :weight, :recipe_id, :user_id)
  end

end
