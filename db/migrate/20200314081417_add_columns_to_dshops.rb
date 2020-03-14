class AddColumnsToDshops < ActiveRecord::Migration[5.2]
  def change
    add_column :dshops, :history, :string
    add_column :dshops, :career1, :string
    add_column :dshops, :career2, :string
    add_column :dshops, :career3, :string
    add_column :dshops, :career4, :string
    add_column :dshops, :career5, :string
    add_column :dshops, :recom1, :string
    add_column :dshops, :recom2, :string
    add_column :dshops, :recom3, :string
    add_column :dshops, :recom4, :string
    add_column :dshops, :recom5, :string
    add_column :dshops, :iititle1, :string
    add_column :dshops, :inof1, :text
    add_column :dshops, :iititle2, :string
    add_column :dshops, :inof2, :text
    add_column :dshops, :iititle3, :string
    add_column :dshops, :inof3, :text
  end
end
