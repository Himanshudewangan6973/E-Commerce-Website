class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :pid
      t.integer :uid
      t.integer :cart_id
      t.integer :price
      t.integer :quan
      t.string :status
      t.string :payid

      t.timestamps
    end
  end
end
