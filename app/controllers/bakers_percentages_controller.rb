class BakersPercentagesController < ApplicationController

  before_action :set_recipe

  def new
  end

  def create
    @recipe.bakers_percentages.build(percentage_params)
    if @recipe.save
      redirect_to @recipe, alert: "Ingredient added!"
    else
      redirect_to new_recipe_bakers_percentage_path(@recipe), alert: "Something went wrong..."
    end
  end

  private

  def percentage_params
    params.require(:bakers_percentage).permit(:ingredient_id, :percent)
  end

  def set_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

end
