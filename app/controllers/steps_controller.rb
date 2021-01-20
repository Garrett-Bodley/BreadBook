class StepsController < ApplicationController
  
  def new
    @current_step = current_bake.steps.build
  end

  def create
    @current_step = current_bake.steps.build(step_params)
    if @current_step.save
      redirect_to current_bake
    else
      redirect_to new_bake_step_path(current_bake), alert: "Something went wrong..."
    end
  end

  def show
    current_step
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def current_bake
    @current_bake ||= Bake.find(params[:bake_id]) if params[:bake_id]
  end

  def current_step
    @current_step ||= Step.find(params[:id]) if params[:id]
  end
    
  def step_params
    params.require(:step).permit(:time, :action, :notes)
  end

end
