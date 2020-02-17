# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# rake db:seed を実行する

# やること      ホットペッパーに登録されている松山のお店の追加
# 背景          ホットペッパーが登録しているお店のジャンルの名前とf9が登録している名前は異なる
#              そこで、f9で登録しているジャンルの名前の一部が、ホットペッパーのジャンル名前と部分的に一致していた場合、
#              追加するお店(ホットペッパー)のジャンルの名前をf9ののジャンル名前で登録することとした


#######################
## check exist other category
## 「その他」カテゴリがf9のジャンルに存在するか確認する
##
## 背景：f9に登録しているカテゴリーとホットペッパーから取得したカテゴリーが一致していないため、
##      ホットペッパーにしか存在しないジャンルは、「その他」カテゴリとして、DBに追加する
#######################

isOtherCategory = false

list_c = Acategory.all
list_c.each do |c|
    if c.name == "その他"
        isOtherCategory = true
    end
end

if isOtherCategory == false
    puts("その他カテゴリを追加してください")
    return
end

#######################
## get f9 category
## f9に登録されているカテゴリを取得する
## ジャンルが「・」で区切らている場合、文字列を分解する
#######################

category_data = {}

list_c.each do |c|
    spatrate_c = c.name.split("・")
    category_data[c.id] = spatrate_c
end

#######################
## add Matsuyama City shop
## 松山のお店をDBに追加する
##
## ホットペッパーに登録されている松山のお店を追加する
## お店のジャンルの名前が一部が、f9で登録しているお店のジャンルの名前に含まれている場合、
## f9のお店のジャンルの名前で、お店を追加する
## ホットペッパーにしか存在しないジャンルは、「その他」カテゴリとする
#######################


require "csv"
file_name = "matsuyama.txt"

CSV.foreach(file_name) do |row|

    other_category = Acategory.find_by(name: "その他")
    category_id = other_category.id
    category_data.each{|id, list_name|
        list_name.each do |name|
            if row[1].include?(name)
                category_id = id
            end
        end
    }

    cate = Acategory.find_by(id: category_id)

    p sprintf("%s, %s", row[0], row[1])
    p sprintf("f9 category_name, %s", cate.name)

    # Ashop.create!(:user_id => 1, :shopname => row[0], :top_id => 7, :area_id => 37, :prefec_id => 1483, :acategory_id => category_id)
end