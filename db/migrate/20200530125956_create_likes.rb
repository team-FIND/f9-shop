class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :ashop, foreign_key: true
      t.references :bshop, foreign_key: true
      t.references :cshop, foreign_key: true
      t.references :dshop, foreign_key: true
      t.references :eshop, foreign_key: true
      t.references :fshop, foreign_key: true
      t.references :gshop, foreign_key: true
      t.references :hshop, foreign_key: true
      t.references :food, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
