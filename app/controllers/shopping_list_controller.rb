class ShoppingListController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id)
    @ingredients = RecipeFood.where(recipe_id: @recipes.map(&:id))
    @foods = Food.where(id: @ingredients.map(&:food_id))

    @total_price = ShoppingList.new.total_price(@ingredients)
  end
end
