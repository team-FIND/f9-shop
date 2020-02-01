class CreateAtmenus < ActiveRecord::Migration[5.2]
  def change
    create_table :atmenus do |t|
      t.references :user, foreign_key: true
      t.references :ashop, foreign_key: true
      t.references :atmenuc, foreign_key: true
      t.string :name
      t.string :time1
      t.string :time2
      t.string :time3
      t.string :time4

      t.timestamps
    end
  end
end
