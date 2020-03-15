class CreateDequips < ActiveRecord::Migration[5.2]
  def change
    create_table :dequips do |t|
      t.references :user, foreign_key: true
      t.references :dshop, foreign_key: true
      t.references :dequipc, foreign_key: true
      t.string :equip_img
      t.string :name
      t.string :explain

      t.timestamps
    end
  end
end
