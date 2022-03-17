class RecipeFood < ActiveRecord::Base
  belongs_to :food
  belongs_to :recipe

  validates :quantity, presence: true
end
