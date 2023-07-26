class AddNameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :mobile, :string
    add_column :users, :address1, :string
    add_column :users, :address2, :string
    add_column :users, :pincode, :string
  end
end
