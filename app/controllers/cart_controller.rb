class CartController < ApplicationController

  def add
    cart << cart_params unless cart.include?(cart_params)
    redirect_to cart_path
  end

  def remove
    cart.delete(params[:id].to_i)
    redirect_to cart_path, alert: "Ingredient removed from recipe"
  end

  def show
    @recipe = current_user.recipes.build
    cart.each{|id| @recipe.bakers_percentages.build(ingredient: Ingredient.find(id))}
  end
  
  private

  def cart_params
    params.require(:ingredient).permit(:id)[:id].to_i
  end

end
