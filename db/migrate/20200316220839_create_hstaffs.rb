class CreateHstaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :hstaffs do |t|
      t.references :user, foreign_key: true
      t.references :hshop, foreign_key: true
      t.references :hstaffc, foreign_key: true
      t.string :staff_img
      t.string :name
      t.string :position1
      t.string :position2
      t.string :explain

      t.timestamps
    end
  end
end
