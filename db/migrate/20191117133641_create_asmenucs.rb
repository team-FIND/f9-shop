class CreateAsmenucs < ActiveRecord::Migration[5.2]
  def change
    create_table :asmenucs do |t|
      t.references :user, foreign_key: true
      t.references :ashop, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
