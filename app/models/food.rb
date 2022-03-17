class Food < ActiveRecord::Base
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :inventory_foods

  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
