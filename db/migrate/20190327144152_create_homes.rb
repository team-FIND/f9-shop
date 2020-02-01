class CreateHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :homes do |t|
      t.string :topimg
      t.string :ad1
      t.string :ad2
      t.string :ad3
      t.string :ad4
      t.string :ad5
      t.string :ad6
      t.string :ad7
      t.string :ad8
      t.string :ad9
      t.string :ad10

      t.timestamps
    end
  end
end
