class CreateAsmenus < ActiveRecord::Migration[5.2]
  def change
    create_table :asmenus do |t|
      t.references :user, foreign_key: true
      t.references :ashop, foreign_key: true
      t.references :asmenuc, foreign_key: true
      t.string :name
      t.string :time1
      t.string :time2
      t.string :time3
      t.string :time4
      t.string :price
      t.string :menu1
      t.string :menu2
      t.string :menu3
      t.string :menu4
      t.string :menu5
      t.string :menu6
      t.string :menu7
      t.string :menu8
      t.string :menu9
      t.string :menu10
      t.string :menu11
      t.string :menu12
      t.string :menu13
      t.string :menu14
      t.string :menu15
      t.string :menu16
      t.string :menu17
      t.string :menu18
      t.string :menu19
      t.string :menu20

      t.timestamps
    end
  end
end
