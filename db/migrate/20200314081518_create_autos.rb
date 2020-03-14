class CreateAutos < ActiveRecord::Migration[5.2]
  def change
    create_table :autos do |t|
      t.references :user, foreign_key: true
      t.references :dshop, foreign_key: true
      t.references :dmenuc, foreign_key: true
      t.references :dmenu, foreign_key: true
      t.string :topimg
      t.string :autoname1
      t.string :autoname2
      t.string :price
      t.string :autoimg1
      t.string :autoimg2
      t.string :autoimg3

      t.timestamps
    end
  end
end
