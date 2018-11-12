class RemovePaisFromCiudads < ActiveRecord::Migration[5.1]
  def change
    remove_column :ciudads, :pais, :string
  end
end
