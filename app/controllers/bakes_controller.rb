class BakesController < ApplicationController
  before_action :current_bake, only: [:edit, :show, :update]

  def new
    @current_bake = current_user.bakes.build
  end

  def create
    @current_bake = current_user.bakes.new(bake_params)
    if @bake.save
      redirect_to @bake
    else
      render :new, alert: "Invalid input(s) provided."
    end
  end

  def edit
  end

  def update
    @current_bake.update(bake_params)
    redirect_to @current_bake
  end

  def show
    @current_bake = Bake.find(params[:id])
  end

  def index
  end

  def destroy
  end
  
  private

  def bake_params
    params.require(:bake).permit(:date, :weight, :recipe_id)
  end

  def current_bake
    @current_bake ||= Bake.find(params[:id])
  end

end
