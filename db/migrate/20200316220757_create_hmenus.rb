class CreateHmenus < ActiveRecord::Migration[5.2]
  def change
    create_table :hmenus do |t|
      t.references :user, foreign_key: true
      t.references :hshop, foreign_key: true
      t.references :hmenuc, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end