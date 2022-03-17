class ShoppingListController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id)
    @missing_foods = []
    @prices = []
    @quantity = []

    @recipes.each do |recipe|
      RecipeFood.where(recipe_id: recipe.id)
    end
  end
end
