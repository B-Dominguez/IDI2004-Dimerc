class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :description
      t.string :cathegory
      t.integer :rep
      t.boolean :solved
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
