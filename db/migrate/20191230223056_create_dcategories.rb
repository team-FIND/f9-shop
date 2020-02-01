class CreateDcategories < ActiveRecord::Migration[5.2]
  def change
    create_table :dcategories do |t|
      t.string :name

      t.timestamps
    end
  end
end
