class BakesController < ApplicationController
  before_action :please_log_in
  before_action :set_bake, except: [:new, :create, :index]
  before_action :check_if_owner, only: [:edit, :update, :destroy]

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
  end

  def index
    @bakes = current_user.bakes.order(date: :desc).page(params[:page]).per(30)
  end

  def destroy
    @bake.destroy
    redirect_to bakes_path
  end
  
  private

  def bake_params
    params.require(:bake).permit(:date, :weight, :recipe_id)
  end

  def check_if_owner
    unless @bake.user == current_user
      redirect_to root_path, alert: "You do not have permission to do that"
    end
  end

  def set_bake
    @bake ||= Bake.find(params[:id])
  end

end
