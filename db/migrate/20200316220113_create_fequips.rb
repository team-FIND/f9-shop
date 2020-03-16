class CreateFequips < ActiveRecord::Migration[5.2]
  def change
    create_table :fequips do |t|
      t.references :user, foreign_key: true
      t.references :fshop, foreign_key: true
      t.references :fequipc, foreign_key: true
      t.string :equip_img
      t.string :name
      t.string :explain

      t.timestamps
    end
  end
end
