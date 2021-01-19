class RecipesController < ApplicationController

  # def new
  #   @recipe ||= Recipe.new
  #   if params[:ingredient_count]
  #     params[:ingredient_count].to_i.times{@recipe.bakers_percentages.build}
  #   else
  #     6.times{@recipe.bakers_percentages.build}
  #   end
  # end

  def add
    recipe_cart << recipe_cart_params.to_i unless recipe_cart.include?(recipe_cart_params)
    redirect_to recipes_cart_path
  end

  def cart
    @recipe = current_user.recipes.build
    recipe_cart.each{|i| @recipe.bakers_percentages.build(ingredient: Ingredient.find(i))}
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else
      redirect_to recipes_cart_path, alert: "Something went wrong..."
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, bakers_percentages_attributes:[:ingredient_id, :percent])
  end

  def recipe_cart_params
    params.require(:ingredient).permit(:id)[:id]
  end
  
end
