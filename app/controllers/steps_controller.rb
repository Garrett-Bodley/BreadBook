class StepsController < ApplicationController
  
  before_action :please_log_in
  before_action :set_bake
  before_action :set_step, only: [:show, :edit, :update, :destroy]
  before_action :check_if_owner

  def new
    @step = @bake.steps.build
  end

  def create
    @step = @bake.steps.build(step_params)
    if @step.save
      redirect_to @bake
    else
      render :new, alert: "Something went wrong..."
    end
  end

  def show
  end

  def edit
  end

  def update
    if @step.update(step_params)
      redirect_to [@bake, @step]
    else
      redirect_to [@bake, @step], alert: "Something went wrong..."
    end
  end

  def destroy
    @step.destroy
    redirect_to @bake, alert: "Step deleted!"
  end

  private

  def set_bake
    @bake ||= Bake.find(params[:bake_id]) if params[:bake_id]
  end

  def set_step
    @step ||= Step.find(params[:id]) if params[:id]
  end
    
  def step_params
    params.require(:step).permit(:time, :action, :notes)
  end

  def check_if_owner
    unless @bake.user == current_user
      redirect_to root_path, alert: "You do not have permission to do that"
    end
  end

end
