class RemoveAutorFromComentarios < ActiveRecord::Migration[5.1]
  def change
    remove_column :comentarios, :autor, :string
  end
end
