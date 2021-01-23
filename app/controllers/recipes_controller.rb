class RecipesController < ApplicationController
  before_action :current_recipe, only: [:show, :edit, :update, :destroy]

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      session[:cart].clear
      redirect_to @recipe
    else
      redirect_to cart_path, alert: "Something went wrong..."
    end
  end

  def add
    cart << cart_params unless cart.include?(cart_params)
    redirect_to cart_path
  end

  def remove
    cart.delete(params[:id].to_i)
    redirect_to cart_path, alert: "Ingredient removed from recipe"
  end

  def new
    @recipe = current_user.recipes.build
    cart.each{|id| @recipe.bakers_percentages.build(ingredient: Ingredient.find(id))}
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
    @recipe.destroy
    redirect_to recipes_path, alert: "Recipe deleted!"
  end

  private

  def current_recipe
    @recipe = Recipe.find(params[:id]) if params[:id]
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, bakers_percentages_attributes:[:ingredient_id, :percent])
  end
  
  def cart_params
    params.require(:ingredient).permit(:id)[:id].to_i
  end
  
end
