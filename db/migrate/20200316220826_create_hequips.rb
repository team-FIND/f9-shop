class CreateHequips < ActiveRecord::Migration[5.2]
  def change
    create_table :hequips do |t|
      t.references :user, foreign_key: true
      t.references :hshop, foreign_key: true
      t.references :hequipc, foreign_key: true
      t.string :equip_img
      t.string :name
      t.string :explain

      t.timestamps
    end
  end
end
