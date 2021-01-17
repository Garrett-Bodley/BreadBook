class IngredientsController < ApplicationController

  before_action :set_ingredient, only: [:edit, :update, :show]

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredients_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render :new, alert: "Invalid input(s) supplied"
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
    byebug
  end

  private

  def ingredients_params
    params.require(:ingredient).permit(:name, :description)
  end

  def set_ingredient
    @ingredient ||= Ingredient.find(params[:id]) if params[:id]
  end

end
