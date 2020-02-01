class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
      t.references :user, foreign_key: true
      t.references :ashop, foreign_key: true
      t.references :admenuc, foreign_key: true
      t.references :admenu, foreign_key: true
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
