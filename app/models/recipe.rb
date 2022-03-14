class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :recipe_foods

  validates :name, presence: true
  validates :description, presence: true
end
