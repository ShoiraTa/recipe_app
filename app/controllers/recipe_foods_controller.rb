class RecipeFoodsController < ApplicationController

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipeFood = RecipeFood.new
  end

  def create
    debugger
    @recipeFood = RecipeFood.new(recipeFood_params)
    @recipeFood.recipe_id = Recipe.find(params[:recipe_id])
    @recipeFood.food_id = Food.find(params[:food_id])
    if @recipeFood.save
      flash[:success] = 'RecipeFood was succesfully created'
      redirect_to root
    else
      redirect_to root
    end

  end

  private

  def recipeFood_params
    params.require(:recipeFood).permit(:quantity)
  end
  
end