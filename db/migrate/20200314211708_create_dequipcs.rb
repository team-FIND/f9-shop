class CreateDequipcs < ActiveRecord::Migration[5.2]
  def change
    create_table :dequipcs do |t|
      t.references :user, foreign_key: true
      t.references :dshop, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
