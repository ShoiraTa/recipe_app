class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @foods = Food.all
    @recipe_id = Recipe.find(params[:recipe_id]).id
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id]).id
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe_id = Recipe.find(params[:recipe_id]).id
    @recipe_food.food_id = Food.find(params[:food_id]).id

    if @recipe_food.save
      flash[:success] = 'RecipeFood was succesfully created'
      redirect_to new_user_recipe_recipe_food_path(current_user.id, @recipe)
    else
      flash[:danger] = @recipe_food.errors.full_messages
      render 'new'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to user_recipe_path(current_user.id, @recipe.id)
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity)
  end
end
