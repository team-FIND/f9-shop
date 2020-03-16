class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.references :user, foreign_key: true
      t.references :hshop, foreign_key: true
      t.references :hmenuc, foreign_key: true
      t.references :hmenu, foreign_key: true
      t.string :topimg
      t.string :itemname1
      t.string :itemname2
      t.string :price
      t.string :itemimg1
      t.string :itemimg2
      t.string :itemimg3

      t.timestamps
    end
  end
end
