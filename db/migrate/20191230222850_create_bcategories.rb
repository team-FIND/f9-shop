class CreateBcategories < ActiveRecord::Migration[5.2]
  def change
    create_table :bcategories do |t|
      t.string :name

      t.timestamps
    end
  end
end
