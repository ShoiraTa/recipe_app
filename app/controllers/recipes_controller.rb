class RecipesController < ApplicationController
  def index; end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      flash[:success] = 'Recipe was succesfully created'
      redirect_to recipes_path
    else
      render 'new'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = RecipeFood.where(recipe_id: @recipe.id)
    render recipes_path unless (@recipe.public == true) || (@recipe.user_id == current_user.id)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :public, :cooking_time, :preparation_time)
  end
end
