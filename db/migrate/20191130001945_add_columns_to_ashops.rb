class AddColumnsToAshops < ActiveRecord::Migration[5.2]
  def change
    add_column :ashops, :history, :string
    add_column :ashops, :career1, :string
    add_column :ashops, :career2, :string
    add_column :ashops, :career3, :string
    add_column :ashops, :career4, :string
    add_column :ashops, :career5, :string
    add_column :ashops, :recom1, :string
    add_column :ashops, :recom2, :string
    add_column :ashops, :recom3, :string
    add_column :ashops, :recom4, :string
    add_column :ashops, :recom5, :string
    add_column :ashops, :iititle1, :string
    add_column :ashops, :inof1, :text
    add_column :ashops, :iititle2, :string
    add_column :ashops, :inof2, :text
    add_column :ashops, :iititle3, :string
    add_column :ashops, :inof3, :text
  end
end
