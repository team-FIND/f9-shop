class CreateGstaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :gstaffs do |t|
      t.references :user, foreign_key: true
      t.references :gshop, foreign_key: true
      t.references :gstaffc, foreign_key: true
      t.string :staff_img
      t.string :name
      t.string :position1
      t.string :position2
      t.string :explain

      t.timestamps
    end
  end
end
