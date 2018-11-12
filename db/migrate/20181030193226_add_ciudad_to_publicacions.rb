class AddCiudadToPublicacions < ActiveRecord::Migration[5.1]
  def change
    add_reference :publicacions, :ciudad, foreign_key: true
  end
end
