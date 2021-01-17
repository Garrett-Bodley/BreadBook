class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
  end

  def edit
  end

  def show
  end

  def index
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :ingredients_id[], :bakers_percentages[])
  end
  
end
