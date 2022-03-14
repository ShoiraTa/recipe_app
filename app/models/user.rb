class User < ActiveRecord::Base
  has_many :foods
  has_many :recipes
  has_many :inventories
end
