class CreateBstaffcs < ActiveRecord::Migration[5.2]
  def change
    create_table :bstaffcs do |t|
      t.references :user, foreign_key: true
      t.references :bshop, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
