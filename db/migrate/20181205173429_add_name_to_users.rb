class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :area, :string
    add_column :users, :cargo, :string
    add_column :users, :anexo, :string
    add_column :users, :location, :string
  end
end
