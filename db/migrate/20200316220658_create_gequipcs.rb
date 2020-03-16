class CreateGequipcs < ActiveRecord::Migration[5.2]
  def change
    create_table :gequipcs do |t|
      t.references :user, foreign_key: true
      t.references :gshop, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
