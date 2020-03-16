class CreateFmenucs < ActiveRecord::Migration[5.2]
  def change
    create_table :fmenucs do |t|
      t.references :user, foreign_key: true
      t.references :fshop, foreign_key: true
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
