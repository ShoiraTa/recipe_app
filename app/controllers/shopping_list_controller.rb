class ShoppingListController < ApplicationController

  def index
    @recipes = Recipe.where(user_id: current_user.id)
    @ingredients = RecipeFood.where(:recipe_id => @recipes.map(&:id) )
    @foods = Food.where(:id => @ingredients.map(&:food_id) )

    def totalPrice 
      price = 0
      @ingredients.each  do |recipe_food|
         food = Food.find(recipe_food.food_id) 
         price += Food.find(recipe_food.food_id).price * recipe_food.quantity
      end
      price
    end

  end
  helper_method :totalPrice
end