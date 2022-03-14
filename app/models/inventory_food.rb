class InventoryFood < ActiveRecord::Base
  belongs_to :food
  belongs_to :inventory
end
