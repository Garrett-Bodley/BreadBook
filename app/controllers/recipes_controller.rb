class RecipesController < ApplicationController

  # def new
  #   @recipe ||= Recipe.new
  #   if params[:ingredient_count]
  #     params[:ingredient_count].to_i.times{@recipe.bakers_percentages.build}
  #   else
  #     6.times{@recipe.bakers_percentages.build}
  #   end
  # end

  def create
    @recipe = Recipe.new(recipe_params)
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

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, bakers_percentages_attributes:[:ingredient_id, :percent])
  end
  
end
