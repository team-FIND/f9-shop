class CreateFstaffcs < ActiveRecord::Migration[5.2]
  def change
    create_table :fstaffcs do |t|
      t.references :user, foreign_key: true
      t.references :fshop, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
