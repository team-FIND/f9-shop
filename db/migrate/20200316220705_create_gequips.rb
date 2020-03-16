class CreateGequips < ActiveRecord::Migration[5.2]
  def change
    create_table :gequips do |t|
      t.references :user, foreign_key: true
      t.references :gshop, foreign_key: true
      t.references :gequipc, foreign_key: true
      t.string :equip_img
      t.string :name
      t.string :explain

      t.timestamps
    end
  end
end
