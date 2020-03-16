class CreateEequips < ActiveRecord::Migration[5.2]
  def change
    create_table :eequips do |t|
      t.references :user, foreign_key: true
      t.references :eshop, foreign_key: true
      t.references :eequipc, foreign_key: true
      t.string :equip_img
      t.string :name
      t.string :explain

      t.timestamps
    end
  end
end
