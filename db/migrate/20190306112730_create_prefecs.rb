class CreatePrefecs < ActiveRecord::Migration[5.2]
  def change
    create_table :prefecs do |t|
      t.references :area, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
