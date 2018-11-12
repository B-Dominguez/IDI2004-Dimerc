class CreatePais < ActiveRecord::Migration[5.1]
  def change
    create_table :pais do |t|
      t.string :nombre
      t.string :descripcion
      t.integer :suscriptores
      t.string :ubicacion

      t.timestamps
    end
  end
end
