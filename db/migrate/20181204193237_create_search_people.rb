class CreateSearchPeople < ActiveRecord::Migration[5.1]
  def change
    create_table :search_people do |t|
      t.string :area, :default => "todas las áreas"
      t.string :name, :default => ""
      t.string :cargo, :default => "todos los cargos"
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
