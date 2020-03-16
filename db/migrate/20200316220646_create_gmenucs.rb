class CreateGmenucs < ActiveRecord::Migration[5.2]
  def change
    create_table :gmenucs do |t|
      t.references :user, foreign_key: true
      t.references :gshop, foreign_key: true
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
