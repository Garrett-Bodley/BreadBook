class RecipesController < ApplicationController

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      session[:cart].clear
      redirect_to @recipe
    else
      redirect_to cart_path, alert: "Something went wrong..."
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def search

  end

  def destroy
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, bakers_percentages_attributes:[:ingredient_id, :percent])
  end
  
end
