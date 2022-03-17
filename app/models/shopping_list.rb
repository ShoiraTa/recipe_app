class ShoppingList < ActiveRecord::Base
  def total_price(ingredients)
    price = 0
    ingredients.each do |recipe_food|
      price += Food.find(recipe_food.food_id).price * recipe_food.quantity
    end
    price
  end
end
