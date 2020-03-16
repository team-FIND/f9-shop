class CreateOuts < ActiveRecord::Migration[5.2]
  def change
    create_table :outs do |t|
      t.references :user, foreign_key: true
      t.references :eshop, foreign_key: true
      t.references :emenuc, foreign_key: true
      t.references :emenu, foreign_key: true
      t.string :topimg
      t.string :outname1
      t.string :outname2
      t.string :price
      t.string :outimg1
      t.string :outimg2
      t.string :outimg3

      t.timestamps
    end
  end
end
