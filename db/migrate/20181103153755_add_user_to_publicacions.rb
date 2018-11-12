class AddUserToPublicacions < ActiveRecord::Migration[5.1]
  def change
    add_reference :publicacions, :user, foreign_key: true
  end
end
