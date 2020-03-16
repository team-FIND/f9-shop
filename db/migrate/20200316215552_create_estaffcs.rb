class CreateEstaffcs < ActiveRecord::Migration[5.2]
  def change
    create_table :estaffcs do |t|
      t.references :user, foreign_key: true
      t.references :eshop, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
