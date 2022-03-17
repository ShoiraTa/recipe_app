class CreateShoppingControllers < ActiveRecord::Migration[7.0]
  def change
    create_table :shopping_controllers do |t|

      t.timestamps
    end
  end
end
