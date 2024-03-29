class IngredientsController < ApplicationController

  before_action :please_log_in, except: [:index, :show, :most_used]
  before_action :set_ingredient, only: [:edit, :update, :show]
  before_action :check_if_owner, only: [:edit, :update, :destroy]

  def new
    @ingredient = @current_user.ingredients.new
  end

  def create
    @ingredient = @current_user.ingredients.new(ingredients_params)
    if @ingredient.save
      redirect_to @ingredient
    else
      render :new
    end
  end

  def edit
  end

  def update
    @ingredient.update(ingredients_params)
    if @ingredient.save
      redirect_to @ingredient, alert: 'Your changes have been saved'
    else
      render :edit, alert: 'Invalid input(s) supplied'
    end
  end

  def show
  end

  def index
    @ingredients = Ingredient.most_recent.page(params[:page]).per(30)
    @text = 'Ingredients'
  end

  def user_ingredients
    @ingredients = Ingredient.owned_by(current_user).page(params[:page]).per(30)
    @text = 'Your Ingredients'
    render :index
  end

  def most_used
    @ingredients = Ingredient.most_used(30)
    @text = 'Most Used Ingredients'
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

  def check_if_owner
    unless @ingredient.user == current_user
      redirect_to @ingredient, alert: 'You do not have permission to do that'
    end
  end

end
