class CreateCstaffcs < ActiveRecord::Migration[5.2]
  def change
    create_table :cstaffcs do |t|
      t.references :user, foreign_key: true
      t.references :cshop, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
