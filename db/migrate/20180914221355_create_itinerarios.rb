class CreateItinerarios < ActiveRecord::Migration[5.1]
  def change
    create_table :itinerarios do |t|
      t.string :nombre
      t.string :descripcion
      t.integer :duracion
      t.string :lugares
      t.string :actividades

      t.timestamps
    end
  end
end
