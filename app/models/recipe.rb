class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true

  def food_arr(recipe)
    food_arr = []
    recipe_foods = RecipeFood.where(recipe_id: recipe)

    recipe_foods.each do |recipe_food|
      Food.where(id: recipe_food.food_id).each do |food|
        food_arr.push(food)
      end
    end
    food_arr
  end

  def total_food_price(food_arr, _recipe_id)
    total = 0
    food_arr.each do |food|
      RecipeFood.where(food_id: food.id).each do |recipe_food|
        @sigle_food_price = food.price * recipe_food.quantity
      end
      total += @sigle_food_price
    end
    total
  end
end
