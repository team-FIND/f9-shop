class CreateGcategories < ActiveRecord::Migration[5.2]
  def change
    create_table :gcategories do |t|
      t.string :name

      t.timestamps
    end
  end
end
