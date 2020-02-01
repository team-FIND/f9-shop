class CreateCcategories < ActiveRecord::Migration[5.2]
  def change
    create_table :ccategories do |t|
      t.string :name

      t.timestamps
    end
  end
end
