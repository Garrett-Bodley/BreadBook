class IngredientsController < ApplicationController

  before_action :set_ingredient, only: [:edit, :update, :show]

  def new
    @ingredient = @current_user.ingredients.new
  end

  def create
    @ingredient = @current_user.ingredients.new(ingredients_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      redirect_to new_ingredient_path, alert: "Invalid input(s) supplied"
    end
  end

  def edit
  end

  def update
    @ingredient.update(ingredients_params)
    if @ingredient.save
      redirect_to @ingredient, alert: "Your changes have been saved"
    else
      render :edit, alert: "Invalid input(s) supplied"
    end
  end

  def show
  end

  def index
    @ingredients = Ingredient.all
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to @user
  end

  private

  def ingredients_params
    params.require(:ingredient).permit(:name, :description)
  end

  def set_ingredient
    @ingredient ||= Ingredient.find(params[:id]) if params[:id]
  end

end
