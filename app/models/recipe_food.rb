class RecipeFood < ActiveRecord::Base
  belongs_to :food
  belongs_to :recipe
end
