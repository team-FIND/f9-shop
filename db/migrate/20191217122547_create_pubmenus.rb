class CreatePubmenus < ActiveRecord::Migration[5.2]
  def change
    create_table :pubmenus do |t|
      t.references :ashop, foreign_key: true
      t.references :user, foreign_key: true
      t.string :name
      t.string :img1
      t.string :img2
      t.string :img3

      t.timestamps
    end
  end
end
