class CreateAshops < ActiveRecord::Migration[5.2]
  def change
    create_table :ashops do |t|
      t.references :top, foreign_key: true
      t.references :area, foreign_key: true
      t.references :prefec, foreign_key: true
      t.references :acategory, foreign_key: true
      t.references :user, foreign_key: true
      t.string :category2
      t.string :category3
      t.string :topimage
      t.string :shopimage1
      t.string :shopimage2
      t.string :shopimage3
      t.string :shopname
      t.string :phone1
      t.string :phone2
      t.string :email1
      t.string :email2
      t.string :postnumb
      t.string :address
      t.string :bus
      t.string :train
      t.string :ititle1
      t.string :info1
      t.string :ititle2
      t.string :info2
      t.string :ititle3
      t.string :info3
      t.string :sunam1
      t.string :sunam2
      t.string :sunam3
      t.string :sunam4
      t.string :sunpm1
      t.string :sunpm2
      t.string :sunpm3
      t.string :sunpm4
      t.string :monam1
      t.string :monam2
      t.string :monam3
      t.string :monam4
      t.string :monpm1
      t.string :monpm2
      t.string :monpm3
      t.string :monpm4
      t.string :tueam1
      t.string :tueam2
      t.string :tueam3
      t.string :tueam4
      t.string :tuepm1
      t.string :tuepm2
      t.string :tuepm3
      t.string :tuepm4
      t.string :wedam1
      t.string :wedam2
      t.string :wedam3
      t.string :wedam4
      t.string :wedpm1
      t.string :wedpm2
      t.string :wedpm3
      t.string :wedpm4
      t.string :thuam1
      t.string :thuam2
      t.string :thuam3
      t.string :thuam4
      t.string :thupm1
      t.string :thupm2
      t.string :thupm3
      t.string :thupm4
      t.string :friam1
      t.string :friam2
      t.string :friam3
      t.string :friam4
      t.string :fripm1
      t.string :fripm2
      t.string :fripm3
      t.string :fripm4
      t.string :satam1
      t.string :satam2
      t.string :satam3
      t.string :satam4
      t.string :satpm1
      t.string :satpm2
      t.string :satpm3
      t.string :satpm4

      t.timestamps
    end
  end
end
