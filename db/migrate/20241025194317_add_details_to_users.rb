class AddDetailsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :name, :string
    add_column :users, :phone, :string
    add_column :users, :role, :integer, default: 0
    add_column :users, :curriculum, :string
    add_column :users, :picture, :string
  end
end
