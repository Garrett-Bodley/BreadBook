class BakesController < ApplicationController
  before_action :set_bake, except: [:new, :create, :index]

  def new
    @bake = current_user.bakes.build
  end

  def create
    @bake = current_user.bakes.new(bake_params)
    if @bake.save
      redirect_to @bake
    else
      render :new, alert: "Invalid input(s) provided."
    end
  end

  def edit
  end

  def update
    @bake.update(bake_params)
    redirect_to @bake
  end

  def show
    @bake = Bake.find(params[:id])
  end

  def index
    @bakes = Bake.where(user: current_user)
  end

  def destroy
    @bake.destroy
    redirect_to bakes_path
  end
  
  private

  def bake_params
    params.require(:bake).permit(:date, :weight, :recipe_id)
  end

  def set_bake
    @bake ||= Bake.find(params[:id])
  end

end
