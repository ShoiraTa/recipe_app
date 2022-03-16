class RecipeFoodsController < ApplicationController

  def create
    @recipeFood = RecipeFood.new(recipeFood_params)
    @recipeFood.user_id = current_user.id
    if @recipeFood.save
      flash[:success] = 'RecipeFood was succesfully created'
      redirect_to recipeFoods_path
    else
      render 'new'
    end

  end

  private

  def recipeFood_params
    params.require(:recipeFood).permit(:name, :description, :public, :cooking_time, :preparation_time)
  end
  
end