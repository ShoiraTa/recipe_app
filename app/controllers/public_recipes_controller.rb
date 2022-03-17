class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.where(public: true).order(created_at: :desc)
    @public_recipe = Recipe.new

    # @total_recipe_price =
    # @recipe = Recipe.find(params[:id])
    # # @items_count= RecipeFood.where(food_id: => )
  end
end
