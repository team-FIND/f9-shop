class CreateBmenucs < ActiveRecord::Migration[5.2]
  def change
    create_table :bmenucs do |t|
      t.references :user, foreign_key: true
      t.references :bshop, foreign_key: true
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
