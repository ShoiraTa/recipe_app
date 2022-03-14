class Food < ActiveRecord::Base
  belongs_to :user
  has_many :recipe_foods
  has_many :inventory_foods
end
