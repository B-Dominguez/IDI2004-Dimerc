class AddPaiRefToCiudads < ActiveRecord::Migration[5.1]
  def change
    add_reference :ciudads, :pai, foreign_key: true
  end
end
