class CreateDmenus < ActiveRecord::Migration[5.2]
  def change
    create_table :dmenus do |t|
      t.references :user, foreign_key: true
      t.references :dshop, foreign_key: true
      t.references :dmenuc, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
