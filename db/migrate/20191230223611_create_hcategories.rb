class CreateHcategories < ActiveRecord::Migration[5.2]
  def change
    create_table :hcategories do |t|
      t.string :name

      t.timestamps
    end
  end
end
