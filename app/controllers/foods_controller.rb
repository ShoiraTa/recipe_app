class FoodsController < ApplicationController

    def index
    end

    def new
        @food = Food.new
    end

    def create
        @food = Food.new(food_params)
        @food.user_id = current_user.id
        if @food.save
            flash[:success] = 'Food created succesfully'
            redirect_to foods_path

        else
            render 'new'
        end
    end

    def destroy
    end

    private

    def food_params
        params.require(:food).permit(:name, :measurement_unit, :price)
    end
end
