class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def show
    @foods = Food.all.where(user_id: current_user.id)
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    if @food.save
      flash[:success] = 'Food created succesfully'
      redirect_to user_foods_path

    else
      render 'new'
    end
  end

  def destroy
    @food = Food.find_by(id: params[:id])
    @food.destroy
    flash[:success] = 'Food deleted'
    redirect_to user_foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
