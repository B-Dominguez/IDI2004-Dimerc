class RemoveCiudadFromPublicacions < ActiveRecord::Migration[5.1]
  def change
    remove_column :publicacions, :ciudad, :string
  end
end
