class CreateBstaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :bstaffs do |t|
      t.references :user, foreign_key: true
      t.references :bshop, foreign_key: true
      t.references :bstaffc, foreign_key: true
      t.string :staffimg
      t.string :name
      t.string :explain1
      t.string :explain2
      t.string :explain3
      t.string :explain4
      t.string :explain5

      t.timestamps
    end
  end
end
