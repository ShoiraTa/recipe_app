class RecipeFoodsController < ApplicationController

  def new
    @recipe = Recipe.find(params[:recipe_id])
    # @foods = Food.where.not(:id => @recipe_food.map(&:food_id) )
    @foods = Food.all
    @recipe_id = Recipe.find(params[:recipe_id]).id
    @recipeFood = RecipeFood.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id]).id
    @recipeFood = RecipeFood.new(recipeFood_params)
    @recipeFood.recipe_id = Recipe.find(params[:recipe_id]).id
    @recipeFood.food_id = Food.find(params[:food_id]).id

    if @recipeFood.save
      flash[:success] = 'RecipeFood was succesfully created'
      redirect_to new_user_recipe_recipe_food_path(current_user.id, @recipe)
    else
      flash[:danger] = @recipeFood.errors.full_messages
      render 'new'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @recipeFood = RecipeFood.find(params[:id])
    @recipeFood.destroy
    redirect_to user_recipe_path(current_user.id, @recipe.id)
  end

  private

  def recipeFood_params
    params.require(:recipe_food).permit(:quantity)
  end
  
end