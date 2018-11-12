class AddPublicacionRefToComentarios < ActiveRecord::Migration[5.1]
  def change
    add_reference :comentarios, :publicacion, foreign_key: true
  end
end
