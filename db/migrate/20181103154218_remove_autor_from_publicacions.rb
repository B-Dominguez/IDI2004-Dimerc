class RemoveAutorFromPublicacions < ActiveRecord::Migration[5.1]
  def change
    remove_column :publicacions, :autor, :string
  end
end
