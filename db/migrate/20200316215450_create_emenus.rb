class CreateEmenus < ActiveRecord::Migration[5.2]
  def change
    create_table :emenus do |t|
      t.references :user, foreign_key: true
      t.references :eshop, foreign_key: true
      t.references :emenuc, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
