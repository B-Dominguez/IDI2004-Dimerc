class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :area
      t.string :nombre
      t.string :cargo

      t.timestamps
    end
  end
end
