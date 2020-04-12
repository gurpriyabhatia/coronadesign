class AddUserToDesigns < ActiveRecord::Migration[5.2]
  def change
    add_reference :designs, :user, foreign_key: true
  end
end
