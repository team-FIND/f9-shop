class CreateCequips < ActiveRecord::Migration[5.2]
  def change
    create_table :cequips do |t|
      t.references :user, foreign_key: true
      t.references :cshop, foreign_key: true
      t.references :cequipc, foreign_key: true
      t.string :equip_img
      t.string :name
      t.string :explain

      t.timestamps
    end
  end
end
