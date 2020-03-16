class CreateHstaffcs < ActiveRecord::Migration[5.2]
  def change
    create_table :hstaffcs do |t|
      t.references :user, foreign_key: true
      t.references :hshop, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
