class CreatePublicacions < ActiveRecord::Migration[5.1]
  def change
    create_table :publicacions do |t|
      t.string :titulo
      t.string :autor
      t.date :fecha
      t.string :ciudad
      t.string :tipo
      t.string :contenido
      t.integer :ptje_rep

      t.timestamps
    end
  end
end
