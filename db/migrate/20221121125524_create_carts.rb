class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.integer :pid
      t.integer :uid
      t.float :price
      t.integer :quantity

      t.timestamps
    end
  end
end
