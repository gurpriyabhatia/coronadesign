class CreateDesigns < ActiveRecord::Migration[5.2]
  def change
    create_table :designs do |t|
      t.string :title
      t.string :source
      t.string :description

      t.timestamps
    end
  end
end
