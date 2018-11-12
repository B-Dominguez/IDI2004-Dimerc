class CreateComentarios < ActiveRecord::Migration[5.1]
  def change
    create_table :comentarios do |t|
      t.string :pertenece
      t.string :autor
      t.string :contenido
      t.integer :ptje_rep
      t.date :fecha

      t.timestamps
    end
  end
end
