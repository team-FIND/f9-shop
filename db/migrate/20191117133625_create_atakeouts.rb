class CreateAtakeouts < ActiveRecord::Migration[5.2]
  def change
    create_table :atakeouts do |t|
      t.references :user, foreign_key: true
      t.references :ashop, foreign_key: true
      t.references :atmenuc, foreign_key: true
      t.references :atmenu, foreign_key: true
      t.string :topimg
      t.string :foodname1
      t.string :foodname2
      t.string :price
      t.string :foodimg1
      t.string :foodimg2
      t.string :foodimg3

      t.timestamps
    end
  end
end
