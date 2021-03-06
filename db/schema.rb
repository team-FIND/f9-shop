# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_30_125956) do

  create_table "acategories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admenucs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ashop_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ashop_id"], name: "index_admenucs_on_ashop_id"
    t.index ["user_id"], name: "index_admenucs_on_user_id"
  end

  create_table "admenus", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ashop_id"
    t.integer "admenuc_id"
    t.string "name"
    t.string "time1"
    t.string "time2"
    t.string "time3"
    t.string "time4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admenuc_id"], name: "index_admenus_on_admenuc_id"
    t.index ["ashop_id"], name: "index_admenus_on_ashop_id"
    t.index ["user_id"], name: "index_admenus_on_user_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "amenucs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ashop_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ashop_id"], name: "index_amenucs_on_ashop_id"
    t.index ["user_id"], name: "index_amenucs_on_user_id"
  end

  create_table "amenus", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ashop_id"
    t.integer "amenuc_id"
    t.string "name"
    t.string "time1"
    t.string "time2"
    t.string "time3"
    t.string "time4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amenuc_id"], name: "index_amenus_on_amenuc_id"
    t.index ["ashop_id"], name: "index_amenus_on_ashop_id"
    t.index ["user_id"], name: "index_amenus_on_user_id"
  end

  create_table "areas", force: :cascade do |t|
    t.integer "top_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["top_id"], name: "index_areas_on_top_id"
  end

  create_table "ashops", force: :cascade do |t|
    t.integer "top_id"
    t.integer "area_id"
    t.integer "prefec_id"
    t.integer "acategory_id"
    t.integer "user_id"
    t.string "category2"
    t.string "category3"
    t.string "topimage"
    t.string "shopimage1"
    t.string "shopimage2"
    t.string "shopimage3"
    t.string "shopname"
    t.string "phone1"
    t.string "phone2"
    t.string "email1"
    t.string "email2"
    t.string "postnumb"
    t.string "address"
    t.string "bus"
    t.string "train"
    t.string "ititle1"
    t.string "info1"
    t.string "ititle2"
    t.string "info2"
    t.string "ititle3"
    t.string "info3"
    t.string "sunam1"
    t.string "sunam2"
    t.string "sunam3"
    t.string "sunam4"
    t.string "sunpm1"
    t.string "sunpm2"
    t.string "sunpm3"
    t.string "sunpm4"
    t.string "monam1"
    t.string "monam2"
    t.string "monam3"
    t.string "monam4"
    t.string "monpm1"
    t.string "monpm2"
    t.string "monpm3"
    t.string "monpm4"
    t.string "tueam1"
    t.string "tueam2"
    t.string "tueam3"
    t.string "tueam4"
    t.string "tuepm1"
    t.string "tuepm2"
    t.string "tuepm3"
    t.string "tuepm4"
    t.string "wedam1"
    t.string "wedam2"
    t.string "wedam3"
    t.string "wedam4"
    t.string "wedpm1"
    t.string "wedpm2"
    t.string "wedpm3"
    t.string "wedpm4"
    t.string "thuam1"
    t.string "thuam2"
    t.string "thuam3"
    t.string "thuam4"
    t.string "thupm1"
    t.string "thupm2"
    t.string "thupm3"
    t.string "thupm4"
    t.string "friam1"
    t.string "friam2"
    t.string "friam3"
    t.string "friam4"
    t.string "fripm1"
    t.string "fripm2"
    t.string "fripm3"
    t.string "fripm4"
    t.string "satam1"
    t.string "satam2"
    t.string "satam3"
    t.string "satam4"
    t.string "satpm1"
    t.string "satpm2"
    t.string "satpm3"
    t.string "satpm4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "history"
    t.string "career1"
    t.string "career2"
    t.string "career3"
    t.string "career4"
    t.string "career5"
    t.string "recom1"
    t.string "recom2"
    t.string "recom3"
    t.string "recom4"
    t.string "recom5"
    t.string "iititle1"
    t.text "inof1"
    t.string "iititle2"
    t.text "inof2"
    t.string "iititle3"
    t.text "inof3"
    t.index ["acategory_id"], name: "index_ashops_on_acategory_id"
    t.index ["area_id"], name: "index_ashops_on_area_id"
    t.index ["prefec_id"], name: "index_ashops_on_prefec_id"
    t.index ["top_id"], name: "index_ashops_on_top_id"
    t.index ["user_id"], name: "index_ashops_on_user_id"
  end

  create_table "asmenucs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ashop_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ashop_id"], name: "index_asmenucs_on_ashop_id"
    t.index ["user_id"], name: "index_asmenucs_on_user_id"
  end

  create_table "asmenus", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ashop_id"
    t.integer "asmenuc_id"
    t.string "name"
    t.string "time1"
    t.string "time2"
    t.string "time3"
    t.string "time4"
    t.string "price"
    t.string "menu1"
    t.string "menu2"
    t.string "menu3"
    t.string "menu4"
    t.string "menu5"
    t.string "menu6"
    t.string "menu7"
    t.string "menu8"
    t.string "menu9"
    t.string "menu10"
    t.string "menu11"
    t.string "menu12"
    t.string "menu13"
    t.string "menu14"
    t.string "menu15"
    t.string "menu16"
    t.string "menu17"
    t.string "menu18"
    t.string "menu19"
    t.string "menu20"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ashop_id"], name: "index_asmenus_on_ashop_id"
    t.index ["asmenuc_id"], name: "index_asmenus_on_asmenuc_id"
    t.index ["user_id"], name: "index_asmenus_on_user_id"
  end

  create_table "atakeouts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ashop_id"
    t.integer "atmenuc_id"
    t.integer "atmenu_id"
    t.string "topimg"
    t.string "foodname1"
    t.string "foodname2"
    t.string "price"
    t.string "foodimg1"
    t.string "foodimg2"
    t.string "foodimg3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ashop_id"], name: "index_atakeouts_on_ashop_id"
    t.index ["atmenu_id"], name: "index_atakeouts_on_atmenu_id"
    t.index ["atmenuc_id"], name: "index_atakeouts_on_atmenuc_id"
    t.index ["user_id"], name: "index_atakeouts_on_user_id"
  end

  create_table "atmenucs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ashop_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ashop_id"], name: "index_atmenucs_on_ashop_id"
    t.index ["user_id"], name: "index_atmenucs_on_user_id"
  end

  create_table "atmenus", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ashop_id"
    t.integer "atmenuc_id"
    t.string "name"
    t.string "time1"
    t.string "time2"
    t.string "time3"
    t.string "time4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ashop_id"], name: "index_atmenus_on_ashop_id"
    t.index ["atmenuc_id"], name: "index_atmenus_on_atmenuc_id"
    t.index ["user_id"], name: "index_atmenus_on_user_id"
  end

  create_table "autos", force: :cascade do |t|
    t.integer "user_id"
    t.integer "dshop_id"
    t.integer "dmenuc_id"
    t.integer "dmenu_id"
    t.string "topimg"
    t.string "autoname1"
    t.string "autoname2"
    t.string "price"
    t.string "autoimg1"
    t.string "autoimg2"
    t.string "autoimg3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dmenu_id"], name: "index_autos_on_dmenu_id"
    t.index ["dmenuc_id"], name: "index_autos_on_dmenuc_id"
    t.index ["dshop_id"], name: "index_autos_on_dshop_id"
    t.index ["user_id"], name: "index_autos_on_user_id"
  end

  create_table "bcategories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bequipcs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "bshop_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bshop_id"], name: "index_bequipcs_on_bshop_id"
    t.index ["user_id"], name: "index_bequipcs_on_user_id"
  end

  create_table "bequips", force: :cascade do |t|
    t.integer "user_id"
    t.integer "bshop_id"
    t.integer "bequipc_id"
    t.string "equip_img"
    t.string "name"
    t.string "explain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bequipc_id"], name: "index_bequips_on_bequipc_id"
    t.index ["bshop_id"], name: "index_bequips_on_bshop_id"
    t.index ["user_id"], name: "index_bequips_on_user_id"
  end

  create_table "bmenucs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "bshop_id"
    t.string "name"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bshop_id"], name: "index_bmenucs_on_bshop_id"
    t.index ["user_id"], name: "index_bmenucs_on_user_id"
  end

  create_table "bshops", force: :cascade do |t|
    t.integer "top_id"
    t.integer "area_id"
    t.integer "prefec_id"
    t.integer "bcategory_id"
    t.integer "user_id"
    t.string "category2"
    t.string "category3"
    t.string "topimage"
    t.string "shopimage1"
    t.string "shopimage2"
    t.string "shopimage3"
    t.string "shopname"
    t.string "phone1"
    t.string "phone2"
    t.string "email1"
    t.string "email2"
    t.string "postnumb"
    t.string "address"
    t.string "bus"
    t.string "train"
    t.string "ititle1"
    t.string "info1"
    t.string "ititle2"
    t.string "info2"
    t.string "ititle3"
    t.string "info3"
    t.string "sunam1"
    t.string "sunam2"
    t.string "sunam3"
    t.string "sunam4"
    t.string "sunpm1"
    t.string "sunpm2"
    t.string "sunpm3"
    t.string "sunpm4"
    t.string "monam1"
    t.string "monam2"
    t.string "monam3"
    t.string "monam4"
    t.string "monpm1"
    t.string "monpm2"
    t.string "monpm3"
    t.string "monpm4"
    t.string "tueam1"
    t.string "tueam2"
    t.string "tueam3"
    t.string "tueam4"
    t.string "tuepm1"
    t.string "tuepm2"
    t.string "tuepm3"
    t.string "tuepm4"
    t.string "wedam1"
    t.string "wedam2"
    t.string "wedam3"
    t.string "wedam4"
    t.string "wedpm1"
    t.string "wedpm2"
    t.string "wedpm3"
    t.string "wedpm4"
    t.string "thuam1"
    t.string "thuam2"
    t.string "thuam3"
    t.string "thuam4"
    t.string "thupm1"
    t.string "thupm2"
    t.string "thupm3"
    t.string "thupm4"
    t.string "friam1"
    t.string "friam2"
    t.string "friam3"
    t.string "friam4"
    t.string "fripm1"
    t.string "fripm2"
    t.string "fripm3"
    t.string "fripm4"
    t.string "satam1"
    t.string "satam2"
    t.string "satam3"
    t.string "satam4"
    t.string "satpm1"
    t.string "satpm2"
    t.string "satpm3"
    t.string "satpm4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_bshops_on_area_id"
    t.index ["bcategory_id"], name: "index_bshops_on_bcategory_id"
    t.index ["prefec_id"], name: "index_bshops_on_prefec_id"
    t.index ["top_id"], name: "index_bshops_on_top_id"
    t.index ["user_id"], name: "index_bshops_on_user_id"
  end

  create_table "bsmenucs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "bshop_id"
    t.string "name"
    t.string "price"
    t.string "detail1"
    t.string "detail2"
    t.string "detail3"
    t.string "detail4"
    t.string "detail5"
    t.string "detail6"
    t.string "detail7"
    t.string "detail8"
    t.string "detail0"
    t.string "detail10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bshop_id"], name: "index_bsmenucs_on_bshop_id"
    t.index ["user_id"], name: "index_bsmenucs_on_user_id"
  end

  create_table "bstaffcs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "bshop_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bshop_id"], name: "index_bstaffcs_on_bshop_id"
    t.index ["user_id"], name: "index_bstaffcs_on_user_id"
  end

  create_table "bstaffs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "bshop_id"
    t.integer "bstaffc_id"
    t.string "staff_img"
    t.string "name"
    t.string "position1"
    t.string "position2"
    t.string "explain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bshop_id"], name: "index_bstaffs_on_bshop_id"
    t.index ["bstaffc_id"], name: "index_bstaffs_on_bstaffc_id"
    t.index ["user_id"], name: "index_bstaffs_on_user_id"
  end

  create_table "ccategories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cequipcs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "cshop_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cshop_id"], name: "index_cequipcs_on_cshop_id"
    t.index ["user_id"], name: "index_cequipcs_on_user_id"
  end

  create_table "cequips", force: :cascade do |t|
    t.integer "user_id"
    t.integer "cshop_id"
    t.integer "cequipc_id"
    t.string "equip_img"
    t.string "name"
    t.string "explain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cequipc_id"], name: "index_cequips_on_cequipc_id"
    t.index ["cshop_id"], name: "index_cequips_on_cshop_id"
    t.index ["user_id"], name: "index_cequips_on_user_id"
  end

  create_table "cmenucs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "cshop_id"
    t.string "name"
    t.string "price"
    t.string "detail1"
    t.string "detail2"
    t.string "detail3"
    t.string "detail4"
    t.string "detail5"
    t.string "detail6"
    t.string "detail7"
    t.string "detail8"
    t.string "detail9"
    t.string "detail10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cshop_id"], name: "index_cmenucs_on_cshop_id"
    t.index ["user_id"], name: "index_cmenucs_on_user_id"
  end

  create_table "cshops", force: :cascade do |t|
    t.integer "top_id"
    t.integer "area_id"
    t.integer "prefec_id"
    t.integer "ccategory_id"
    t.integer "user_id"
    t.string "category2"
    t.string "category3"
    t.string "topimage"
    t.string "shopimage1"
    t.string "shopimage2"
    t.string "shopimage3"
    t.string "shopname"
    t.string "phone1"
    t.string "phone2"
    t.string "email1"
    t.string "email2"
    t.string "postnumb"
    t.string "address"
    t.string "bus"
    t.string "train"
    t.string "ititle1"
    t.string "info1"
    t.string "ititle2"
    t.string "info2"
    t.string "ititle3"
    t.string "info3"
    t.string "sunam1"
    t.string "sunam2"
    t.string "sunam3"
    t.string "sunam4"
    t.string "sunpm1"
    t.string "sunpm2"
    t.string "sunpm3"
    t.string "sunpm4"
    t.string "monam1"
    t.string "monam2"
    t.string "monam3"
    t.string "monam4"
    t.string "monpm1"
    t.string "monpm2"
    t.string "monpm3"
    t.string "monpm4"
    t.string "tueam1"
    t.string "tueam2"
    t.string "tueam3"
    t.string "tueam4"
    t.string "tuepm1"
    t.string "tuepm2"
    t.string "tuepm3"
    t.string "tuepm4"
    t.string "wedam1"
    t.string "wedam2"
    t.string "wedam3"
    t.string "wedam4"
    t.string "wedpm1"
    t.string "wedpm2"
    t.string "wedpm3"
    t.string "wedpm4"
    t.string "thuam1"
    t.string "thuam2"
    t.string "thuam3"
    t.string "thuam4"
    t.string "thupm1"
    t.string "thupm2"
    t.string "thupm3"
    t.string "thupm4"
    t.string "friam1"
    t.string "friam2"
    t.string "friam3"
    t.string "friam4"
    t.string "fripm1"
    t.string "fripm2"
    t.string "fripm3"
    t.string "fripm4"
    t.string "satam1"
    t.string "satam2"
    t.string "satam3"
    t.string "satam4"
    t.string "satpm1"
    t.string "satpm2"
    t.string "satpm3"
    t.string "satpm4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_cshops_on_area_id"
    t.index ["ccategory_id"], name: "index_cshops_on_ccategory_id"
    t.index ["prefec_id"], name: "index_cshops_on_prefec_id"
    t.index ["top_id"], name: "index_cshops_on_top_id"
    t.index ["user_id"], name: "index_cshops_on_user_id"
  end

  create_table "csmenucs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "cshop_id"
    t.string "name"
    t.string "price"
    t.string "detail1"
    t.string "detail2"
    t.string "detail3"
    t.string "detail4"
    t.string "detail5"
    t.string "detail6"
    t.string "detail7"
    t.string "detail8"
    t.string "detail9"
    t.string "detail10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cshop_id"], name: "index_csmenucs_on_cshop_id"
    t.index ["user_id"], name: "index_csmenucs_on_user_id"
  end

  create_table "cstaffcs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "cshop_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cshop_id"], name: "index_cstaffcs_on_cshop_id"
    t.index ["user_id"], name: "index_cstaffcs_on_user_id"
  end

  create_table "cstaffs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "cshop_id"
    t.integer "cstaffc_id"
    t.string "staff_img"
    t.string "name"
    t.string "position1"
    t.string "position2"
    t.string "explain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cshop_id"], name: "index_cstaffs_on_cshop_id"
    t.index ["cstaffc_id"], name: "index_cstaffs_on_cstaffc_id"
    t.index ["user_id"], name: "index_cstaffs_on_user_id"
  end

  create_table "dcategories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dequipcs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "dshop_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dshop_id"], name: "index_dequipcs_on_dshop_id"
    t.index ["user_id"], name: "index_dequipcs_on_user_id"
  end

  create_table "dequips", force: :cascade do |t|
    t.integer "user_id"
    t.integer "dshop_id"
    t.integer "dequipc_id"
    t.string "equip_img"
    t.string "name"
    t.string "explain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dequipc_id"], name: "index_dequips_on_dequipc_id"
    t.index ["dshop_id"], name: "index_dequips_on_dshop_id"
    t.index ["user_id"], name: "index_dequips_on_user_id"
  end

  create_table "dmenucs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "dshop_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dshop_id"], name: "index_dmenucs_on_dshop_id"
    t.index ["user_id"], name: "index_dmenucs_on_user_id"
  end

  create_table "dmenus", force: :cascade do |t|
    t.integer "user_id"
    t.integer "dshop_id"
    t.integer "dmenuc_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dmenuc_id"], name: "index_dmenus_on_dmenuc_id"
    t.index ["dshop_id"], name: "index_dmenus_on_dshop_id"
    t.index ["user_id"], name: "index_dmenus_on_user_id"
  end

  create_table "drinks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ashop_id"
    t.integer "admenuc_id"
    t.integer "admenu_id"
    t.string "topimg"
    t.string "foodname1"
    t.string "foodname2"
    t.string "price"
    t.string "foodimg1"
    t.string "foodimg2"
    t.string "foodimg3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admenu_id"], name: "index_drinks_on_admenu_id"
    t.index ["admenuc_id"], name: "index_drinks_on_admenuc_id"
    t.index ["ashop_id"], name: "index_drinks_on_ashop_id"
    t.index ["user_id"], name: "index_drinks_on_user_id"
  end

  create_table "dshops", force: :cascade do |t|
    t.integer "top_id"
    t.integer "area_id"
    t.integer "prefec_id"
    t.integer "dcategory_id"
    t.integer "user_id"
    t.string "category2"
    t.string "category3"
    t.string "topimage"
    t.string "shopimage1"
    t.string "shopimage2"
    t.string "shopimage3"
    t.string "shopname"
    t.string "phone1"
    t.string "phone2"
    t.string "email1"
    t.string "email2"
    t.string "postnumb"
    t.string "address"
    t.string "bus"
    t.string "train"
    t.string "ititle1"
    t.string "info1"
    t.string "ititle2"
    t.string "info2"
    t.string "ititle3"
    t.string "info3"
    t.string "sunam1"
    t.string "sunam2"
    t.string "sunam3"
    t.string "sunam4"
    t.string "sunpm1"
    t.string "sunpm2"
    t.string "sunpm3"
    t.string "sunpm4"
    t.string "monam1"
    t.string "monam2"
    t.string "monam3"
    t.string "monam4"
    t.string "monpm1"
    t.string "monpm2"
    t.string "monpm3"
    t.string "monpm4"
    t.string "tueam1"
    t.string "tueam2"
    t.string "tueam3"
    t.string "tueam4"
    t.string "tuepm1"
    t.string "tuepm2"
    t.string "tuepm3"
    t.string "tuepm4"
    t.string "wedam1"
    t.string "wedam2"
    t.string "wedam3"
    t.string "wedam4"
    t.string "wedpm1"
    t.string "wedpm2"
    t.string "wedpm3"
    t.string "wedpm4"
    t.string "thuam1"
    t.string "thuam2"
    t.string "thuam3"
    t.string "thuam4"
    t.string "thupm1"
    t.string "thupm2"
    t.string "thupm3"
    t.string "thupm4"
    t.string "friam1"
    t.string "friam2"
    t.string "friam3"
    t.string "friam4"
    t.string "fripm1"
    t.string "fripm2"
    t.string "fripm3"
    t.string "fripm4"
    t.string "satam1"
    t.string "satam2"
    t.string "satam3"
    t.string "satam4"
    t.string "satpm1"
    t.string "satpm2"
    t.string "satpm3"
    t.string "satpm4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "history"
    t.string "career1"
    t.string "career2"
    t.string "career3"
    t.string "career4"
    t.string "career5"
    t.string "recom1"
    t.string "recom2"
    t.string "recom3"
    t.string "recom4"
    t.string "recom5"
    t.string "iititle1"
    t.text "inof1"
    t.string "iititle2"
    t.text "inof2"
    t.string "iititle3"
    t.text "inof3"
    t.index ["area_id"], name: "index_dshops_on_area_id"
    t.index ["dcategory_id"], name: "index_dshops_on_dcategory_id"
    t.index ["prefec_id"], name: "index_dshops_on_prefec_id"
    t.index ["top_id"], name: "index_dshops_on_top_id"
    t.index ["user_id"], name: "index_dshops_on_user_id"
  end

  create_table "dsmenucs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "dshop_id"
    t.string "name"
    t.string "price"
    t.string "detail1"
    t.string "detail2"
    t.string "detail3"
    t.string "detail4"
    t.string "detail5"
    t.string "detail6"
    t.string "detail7"
    t.string "detail8"
    t.string "detail9"
    t.string "detail10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dshop_id"], name: "index_dsmenucs_on_dshop_id"
    t.index ["user_id"], name: "index_dsmenucs_on_user_id"
  end

  create_table "dstaffcs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "dshop_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dshop_id"], name: "index_dstaffcs_on_dshop_id"
    t.index ["user_id"], name: "index_dstaffcs_on_user_id"
  end

  create_table "dstaffs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "dshop_id"
    t.integer "dstaffc_id"
    t.string "staff_img"
    t.string "name"
    t.string "position1"
    t.string "position2"
    t.string "explain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dshop_id"], name: "index_dstaffs_on_dshop_id"
    t.index ["dstaffc_id"], name: "index_dstaffs_on_dstaffc_id"
    t.index ["user_id"], name: "index_dstaffs_on_user_id"
  end

  create_table "ecategories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "eequipcs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "eshop_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["eshop_id"], name: "index_eequipcs_on_eshop_id"
    t.index ["user_id"], name: "index_eequipcs_on_user_id"
  end

  create_table "eequips", force: :cascade do |t|
    t.integer "user_id"
    t.integer "eshop_id"
    t.integer "eequipc_id"
    t.string "equip_img"
    t.string "name"
    t.string "explain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["eequipc_id"], name: "index_eequips_on_eequipc_id"
    t.index ["eshop_id"], name: "index_eequips_on_eshop_id"
    t.index ["user_id"], name: "index_eequips_on_user_id"
  end

  create_table "emenucs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "eshop_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["eshop_id"], name: "index_emenucs_on_eshop_id"
    t.index ["user_id"], name: "index_emenucs_on_user_id"
  end

  create_table "emenus", force: :cascade do |t|
    t.integer "user_id"
    t.integer "eshop_id"
    t.integer "emenuc_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["emenuc_id"], name: "index_emenus_on_emenuc_id"
    t.index ["eshop_id"], name: "index_emenus_on_eshop_id"
    t.index ["user_id"], name: "index_emenus_on_user_id"
  end

  create_table "eshops", force: :cascade do |t|
    t.integer "top_id"
    t.integer "area_id"
    t.integer "prefec_id"
    t.integer "ecategory_id"
    t.integer "user_id"
    t.string "category2"
    t.string "category3"
    t.string "topimage"
    t.string "shopimage1"
    t.string "shopimage2"
    t.string "shopimage3"
    t.string "shopname"
    t.string "phone1"
    t.string "phone2"
    t.string "email1"
    t.string "email2"
    t.string "postnumb"
    t.string "address"
    t.string "bus"
    t.string "train"
    t.string "ititle1"
    t.string "info1"
    t.string "ititle2"
    t.string "info2"
    t.string "ititle3"
    t.string "info3"
    t.string "sunam1"
    t.string "sunam2"
    t.string "sunam3"
    t.string "sunam4"
    t.string "sunpm1"
    t.string "sunpm2"
    t.string "sunpm3"
    t.string "sunpm4"
    t.string "monam1"
    t.string "monam2"
    t.string "monam3"
    t.string "monam4"
    t.string "monpm1"
    t.string "monpm2"
    t.string "monpm3"
    t.string "monpm4"
    t.string "tueam1"
    t.string "tueam2"
    t.string "tueam3"
    t.string "tueam4"
    t.string "tuepm1"
    t.string "tuepm2"
    t.string "tuepm3"
    t.string "tuepm4"
    t.string "wedam1"
    t.string "wedam2"
    t.string "wedam3"
    t.string "wedam4"
    t.string "wedpm1"
    t.string "wedpm2"
    t.string "wedpm3"
    t.string "wedpm4"
    t.string "thuam1"
    t.string "thuam2"
    t.string "thuam3"
    t.string "thuam4"
    t.string "thupm1"
    t.string "thupm2"
    t.string "thupm3"
    t.string "thupm4"
    t.string "friam1"
    t.string "friam2"
    t.string "friam3"
    t.string "friam4"
    t.string "fripm1"
    t.string "fripm2"
    t.string "fripm3"
    t.string "fripm4"
    t.string "satam1"
    t.string "satam2"
    t.string "satam3"
    t.string "satam4"
    t.string "satpm1"
    t.string "satpm2"
    t.string "satpm3"
    t.string "satpm4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_eshops_on_area_id"
    t.index ["ecategory_id"], name: "index_eshops_on_ecategory_id"
    t.index ["prefec_id"], name: "index_eshops_on_prefec_id"
    t.index ["top_id"], name: "index_eshops_on_top_id"
    t.index ["user_id"], name: "index_eshops_on_user_id"
  end

  create_table "esmenucs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "eshop_id"
    t.string "name"
    t.string "price"
    t.string "detail1"
    t.string "detail2"
    t.string "detail3"
    t.string "detail4"
    t.string "detail5"
    t.string "detail6"
    t.string "detail7"
    t.string "detail8"
    t.string "detail9"
    t.string "detail10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["eshop_id"], name: "index_esmenucs_on_eshop_id"
    t.index ["user_id"], name: "index_esmenucs_on_user_id"
  end

  create_table "estaffcs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "eshop_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["eshop_id"], name: "index_estaffcs_on_eshop_id"
    t.index ["user_id"], name: "index_estaffcs_on_user_id"
  end

  create_table "estaffs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "eshop_id"
    t.integer "estaffc_id"
    t.string "staff_img"
    t.string "name"
    t.string "position1"
    t.string "position2"
    t.string "explain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["eshop_id"], name: "index_estaffs_on_eshop_id"
    t.index ["estaffc_id"], name: "index_estaffs_on_estaffc_id"
    t.index ["user_id"], name: "index_estaffs_on_user_id"
  end

  create_table "fcategories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fequipcs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "fshop_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fshop_id"], name: "index_fequipcs_on_fshop_id"
    t.index ["user_id"], name: "index_fequipcs_on_user_id"
  end

  create_table "fequips", force: :cascade do |t|
    t.integer "user_id"
    t.integer "fshop_id"
    t.integer "fequipc_id"
    t.string "equip_img"
    t.string "name"
    t.string "explain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fequipc_id"], name: "index_fequips_on_fequipc_id"
    t.index ["fshop_id"], name: "index_fequips_on_fshop_id"
    t.index ["user_id"], name: "index_fequips_on_user_id"
  end

  create_table "fmenucs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "fshop_id"
    t.string "name"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fshop_id"], name: "index_fmenucs_on_fshop_id"
    t.index ["user_id"], name: "index_fmenucs_on_user_id"
  end

  create_table "foods", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ashop_id"
    t.integer "amenuc_id"
    t.integer "amenu_id"
    t.string "topimg"
    t.string "foodname1"
    t.string "foodname2"
    t.string "price"
    t.string "foodimg1"
    t.string "foodimg2"
    t.string "foodimg3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amenu_id"], name: "index_foods_on_amenu_id"
    t.index ["amenuc_id"], name: "index_foods_on_amenuc_id"
    t.index ["ashop_id"], name: "index_foods_on_ashop_id"
    t.index ["user_id"], name: "index_foods_on_user_id"
  end

  create_table "fshops", force: :cascade do |t|
    t.integer "top_id"
    t.integer "area_id"
    t.integer "prefec_id"
    t.integer "fcategory_id"
    t.integer "user_id"
    t.string "category2"
    t.string "category3"
    t.string "topimage"
    t.string "shopimage1"
    t.string "shopimage2"
    t.string "shopimage3"
    t.string "shopname"
    t.string "phone1"
    t.string "phone2"
    t.string "email1"
    t.string "email2"
    t.string "postnumb"
    t.string "address"
    t.string "bus"
    t.string "train"
    t.string "ititle1"
    t.string "info1"
    t.string "ititle2"
    t.string "info2"
    t.string "ititle3"
    t.string "info3"
    t.string "sunam1"
    t.string "sunam2"
    t.string "sunam3"
    t.string "sunam4"
    t.string "sunpm1"
    t.string "sunpm2"
    t.string "sunpm3"
    t.string "sunpm4"
    t.string "monam1"
    t.string "monam2"
    t.string "monam3"
    t.string "monam4"
    t.string "monpm1"
    t.string "monpm2"
    t.string "monpm3"
    t.string "monpm4"
    t.string "tueam1"
    t.string "tueam2"
    t.string "tueam3"
    t.string "tueam4"
    t.string "tuepm1"
    t.string "tuepm2"
    t.string "tuepm3"
    t.string "tuepm4"
    t.string "wedam1"
    t.string "wedam2"
    t.string "wedam3"
    t.string "wedam4"
    t.string "wedpm1"
    t.string "wedpm2"
    t.string "wedpm3"
    t.string "wedpm4"
    t.string "thuam1"
    t.string "thuam2"
    t.string "thuam3"
    t.string "thuam4"
    t.string "thupm1"
    t.string "thupm2"
    t.string "thupm3"
    t.string "thupm4"
    t.string "friam1"
    t.string "friam2"
    t.string "friam3"
    t.string "friam4"
    t.string "fripm1"
    t.string "fripm2"
    t.string "fripm3"
    t.string "fripm4"
    t.string "satam1"
    t.string "satam2"
    t.string "satam3"
    t.string "satam4"
    t.string "satpm1"
    t.string "satpm2"
    t.string "satpm3"
    t.string "satpm4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_fshops_on_area_id"
    t.index ["fcategory_id"], name: "index_fshops_on_fcategory_id"
    t.index ["prefec_id"], name: "index_fshops_on_prefec_id"
    t.index ["top_id"], name: "index_fshops_on_top_id"
    t.index ["user_id"], name: "index_fshops_on_user_id"
  end

  create_table "fsmenucs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "fshop_id"
    t.string "name"
    t.string "price"
    t.string "detail1"
    t.string "detail2"
    t.string "detail3"
    t.string "detail4"
    t.string "detail5"
    t.string "detail6"
    t.string "detail7"
    t.string "detail8"
    t.string "detail9"
    t.string "detail10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fshop_id"], name: "index_fsmenucs_on_fshop_id"
    t.index ["user_id"], name: "index_fsmenucs_on_user_id"
  end

  create_table "fstaffcs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "fshop_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fshop_id"], name: "index_fstaffcs_on_fshop_id"
    t.index ["user_id"], name: "index_fstaffcs_on_user_id"
  end

  create_table "fstaffs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "fshop_id"
    t.integer "fstaffc_id"
    t.string "staff_img"
    t.string "name"
    t.string "position1"
    t.string "position2"
    t.string "explain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fshop_id"], name: "index_fstaffs_on_fshop_id"
    t.index ["fstaffc_id"], name: "index_fstaffs_on_fstaffc_id"
    t.index ["user_id"], name: "index_fstaffs_on_user_id"
  end

  create_table "gcategories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gequipcs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "gshop_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gshop_id"], name: "index_gequipcs_on_gshop_id"
    t.index ["user_id"], name: "index_gequipcs_on_user_id"
  end

  create_table "gequips", force: :cascade do |t|
    t.integer "user_id"
    t.integer "gshop_id"
    t.integer "gequipc_id"
    t.string "equip_img"
    t.string "name"
    t.string "explain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gequipc_id"], name: "index_gequips_on_gequipc_id"
    t.index ["gshop_id"], name: "index_gequips_on_gshop_id"
    t.index ["user_id"], name: "index_gequips_on_user_id"
  end

  create_table "gmenucs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "gshop_id"
    t.string "name"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gshop_id"], name: "index_gmenucs_on_gshop_id"
    t.index ["user_id"], name: "index_gmenucs_on_user_id"
  end

  create_table "gshops", force: :cascade do |t|
    t.integer "top_id"
    t.integer "area_id"
    t.integer "prefec_id"
    t.integer "gcategory_id"
    t.integer "user_id"
    t.string "category2"
    t.string "category3"
    t.string "topimage"
    t.string "shopimage1"
    t.string "shopimage2"
    t.string "shopimage3"
    t.string "shopname"
    t.string "phone1"
    t.string "phone2"
    t.string "email1"
    t.string "email2"
    t.string "postnumb"
    t.string "address"
    t.string "bus"
    t.string "train"
    t.string "ititle1"
    t.string "info1"
    t.string "ititle2"
    t.string "info2"
    t.string "ititle3"
    t.string "info3"
    t.string "sunam1"
    t.string "sunam2"
    t.string "sunam3"
    t.string "sunam4"
    t.string "sunpm1"
    t.string "sunpm2"
    t.string "sunpm3"
    t.string "sunpm4"
    t.string "monam1"
    t.string "monam2"
    t.string "monam3"
    t.string "monam4"
    t.string "monpm1"
    t.string "monpm2"
    t.string "monpm3"
    t.string "monpm4"
    t.string "tueam1"
    t.string "tueam2"
    t.string "tueam3"
    t.string "tueam4"
    t.string "tuepm1"
    t.string "tuepm2"
    t.string "tuepm3"
    t.string "tuepm4"
    t.string "wedam1"
    t.string "wedam2"
    t.string "wedam3"
    t.string "wedam4"
    t.string "wedpm1"
    t.string "wedpm2"
    t.string "wedpm3"
    t.string "wedpm4"
    t.string "thuam1"
    t.string "thuam2"
    t.string "thuam3"
    t.string "thuam4"
    t.string "thupm1"
    t.string "thupm2"
    t.string "thupm3"
    t.string "thupm4"
    t.string "friam1"
    t.string "friam2"
    t.string "friam3"
    t.string "friam4"
    t.string "fripm1"
    t.string "fripm2"
    t.string "fripm3"
    t.string "fripm4"
    t.string "satam1"
    t.string "satam2"
    t.string "satam3"
    t.string "satam4"
    t.string "satpm1"
    t.string "satpm2"
    t.string "satpm3"
    t.string "satpm4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_gshops_on_area_id"
    t.index ["gcategory_id"], name: "index_gshops_on_gcategory_id"
    t.index ["prefec_id"], name: "index_gshops_on_prefec_id"
    t.index ["top_id"], name: "index_gshops_on_top_id"
    t.index ["user_id"], name: "index_gshops_on_user_id"
  end

  create_table "gsmenucs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "gshop_id"
    t.string "name"
    t.string "price"
    t.string "detail1"
    t.string "detail2"
    t.string "detail3"
    t.string "detail4"
    t.string "detail5"
    t.string "detail6"
    t.string "detail7"
    t.string "detail8"
    t.string "detail9"
    t.string "detail10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gshop_id"], name: "index_gsmenucs_on_gshop_id"
    t.index ["user_id"], name: "index_gsmenucs_on_user_id"
  end

  create_table "gstaffcs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "gshop_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gshop_id"], name: "index_gstaffcs_on_gshop_id"
    t.index ["user_id"], name: "index_gstaffcs_on_user_id"
  end

  create_table "gstaffs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "gshop_id"
    t.integer "gstaffc_id"
    t.string "staff_img"
    t.string "name"
    t.string "position1"
    t.string "position2"
    t.string "explain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gshop_id"], name: "index_gstaffs_on_gshop_id"
    t.index ["gstaffc_id"], name: "index_gstaffs_on_gstaffc_id"
    t.index ["user_id"], name: "index_gstaffs_on_user_id"
  end

  create_table "hcategories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hequipcs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "hshop_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hshop_id"], name: "index_hequipcs_on_hshop_id"
    t.index ["user_id"], name: "index_hequipcs_on_user_id"
  end

  create_table "hequips", force: :cascade do |t|
    t.integer "user_id"
    t.integer "hshop_id"
    t.integer "hequipc_id"
    t.string "equip_img"
    t.string "name"
    t.string "explain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hequipc_id"], name: "index_hequips_on_hequipc_id"
    t.index ["hshop_id"], name: "index_hequips_on_hshop_id"
    t.index ["user_id"], name: "index_hequips_on_user_id"
  end

  create_table "hmenucs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "hshop_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hshop_id"], name: "index_hmenucs_on_hshop_id"
    t.index ["user_id"], name: "index_hmenucs_on_user_id"
  end

  create_table "hmenus", force: :cascade do |t|
    t.integer "user_id"
    t.integer "hshop_id"
    t.integer "hmenuc_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hmenuc_id"], name: "index_hmenus_on_hmenuc_id"
    t.index ["hshop_id"], name: "index_hmenus_on_hshop_id"
    t.index ["user_id"], name: "index_hmenus_on_user_id"
  end

  create_table "homes", force: :cascade do |t|
    t.string "topimg"
    t.string "ad1"
    t.string "ad2"
    t.string "ad3"
    t.string "ad4"
    t.string "ad5"
    t.string "ad6"
    t.string "ad7"
    t.string "ad8"
    t.string "ad9"
    t.string "ad10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hshops", force: :cascade do |t|
    t.integer "top_id"
    t.integer "area_id"
    t.integer "prefec_id"
    t.integer "hcategory_id"
    t.integer "user_id"
    t.string "category2"
    t.string "category3"
    t.string "topimage"
    t.string "shopimage1"
    t.string "shopimage2"
    t.string "shopimage3"
    t.string "shopname"
    t.string "phone1"
    t.string "phone2"
    t.string "email1"
    t.string "email2"
    t.string "postnumb"
    t.string "address"
    t.string "bus"
    t.string "train"
    t.string "ititle1"
    t.string "info1"
    t.string "ititle2"
    t.string "info2"
    t.string "ititle3"
    t.string "info3"
    t.string "sunam1"
    t.string "sunam2"
    t.string "sunam3"
    t.string "sunam4"
    t.string "sunpm1"
    t.string "sunpm2"
    t.string "sunpm3"
    t.string "sunpm4"
    t.string "monam1"
    t.string "monam2"
    t.string "monam3"
    t.string "monam4"
    t.string "monpm1"
    t.string "monpm2"
    t.string "monpm3"
    t.string "monpm4"
    t.string "tueam1"
    t.string "tueam2"
    t.string "tueam3"
    t.string "tueam4"
    t.string "tuepm1"
    t.string "tuepm2"
    t.string "tuepm3"
    t.string "tuepm4"
    t.string "wedam1"
    t.string "wedam2"
    t.string "wedam3"
    t.string "wedam4"
    t.string "wedpm1"
    t.string "wedpm2"
    t.string "wedpm3"
    t.string "wedpm4"
    t.string "thuam1"
    t.string "thuam2"
    t.string "thuam3"
    t.string "thuam4"
    t.string "thupm1"
    t.string "thupm2"
    t.string "thupm3"
    t.string "thupm4"
    t.string "friam1"
    t.string "friam2"
    t.string "friam3"
    t.string "friam4"
    t.string "fripm1"
    t.string "fripm2"
    t.string "fripm3"
    t.string "fripm4"
    t.string "satam1"
    t.string "satam2"
    t.string "satam3"
    t.string "satam4"
    t.string "satpm1"
    t.string "satpm2"
    t.string "satpm3"
    t.string "satpm4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_hshops_on_area_id"
    t.index ["hcategory_id"], name: "index_hshops_on_hcategory_id"
    t.index ["prefec_id"], name: "index_hshops_on_prefec_id"
    t.index ["top_id"], name: "index_hshops_on_top_id"
    t.index ["user_id"], name: "index_hshops_on_user_id"
  end

  create_table "hsmenucs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "hshop_id"
    t.string "name"
    t.string "price"
    t.string "detail1"
    t.string "detail2"
    t.string "detail3"
    t.string "detail4"
    t.string "detail5"
    t.string "detail6"
    t.string "detail7"
    t.string "detail8"
    t.string "detail9"
    t.string "detail10"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hshop_id"], name: "index_hsmenucs_on_hshop_id"
    t.index ["user_id"], name: "index_hsmenucs_on_user_id"
  end

  create_table "hstaffcs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "hshop_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hshop_id"], name: "index_hstaffcs_on_hshop_id"
    t.index ["user_id"], name: "index_hstaffcs_on_user_id"
  end

  create_table "hstaffs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "hshop_id"
    t.integer "hstaffc_id"
    t.string "staff_img"
    t.string "name"
    t.string "position1"
    t.string "position2"
    t.string "explain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hshop_id"], name: "index_hstaffs_on_hshop_id"
    t.index ["hstaffc_id"], name: "index_hstaffs_on_hstaffc_id"
    t.index ["user_id"], name: "index_hstaffs_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "user_id"
    t.integer "hshop_id"
    t.integer "hmenuc_id"
    t.integer "hmenu_id"
    t.string "topimg"
    t.string "itemname1"
    t.string "itemname2"
    t.string "price"
    t.string "itemimg1"
    t.string "itemimg2"
    t.string "itemimg3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hmenu_id"], name: "index_items_on_hmenu_id"
    t.index ["hmenuc_id"], name: "index_items_on_hmenuc_id"
    t.index ["hshop_id"], name: "index_items_on_hshop_id"
    t.index ["user_id"], name: "index_items_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "ashop_id"
    t.integer "bshop_id"
    t.integer "cshop_id"
    t.integer "dshop_id"
    t.integer "eshop_id"
    t.integer "fshop_id"
    t.integer "gshop_id"
    t.integer "hshop_id"
    t.integer "food_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ashop_id"], name: "index_likes_on_ashop_id"
    t.index ["bshop_id"], name: "index_likes_on_bshop_id"
    t.index ["cshop_id"], name: "index_likes_on_cshop_id"
    t.index ["dshop_id"], name: "index_likes_on_dshop_id"
    t.index ["eshop_id"], name: "index_likes_on_eshop_id"
    t.index ["food_id"], name: "index_likes_on_food_id"
    t.index ["fshop_id"], name: "index_likes_on_fshop_id"
    t.index ["gshop_id"], name: "index_likes_on_gshop_id"
    t.index ["hshop_id"], name: "index_likes_on_hshop_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "outs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "eshop_id"
    t.integer "emenuc_id"
    t.integer "emenu_id"
    t.string "topimg"
    t.string "outname1"
    t.string "outname2"
    t.string "price"
    t.string "outimg1"
    t.string "outimg2"
    t.string "outimg3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["emenu_id"], name: "index_outs_on_emenu_id"
    t.index ["emenuc_id"], name: "index_outs_on_emenuc_id"
    t.index ["eshop_id"], name: "index_outs_on_eshop_id"
    t.index ["user_id"], name: "index_outs_on_user_id"
  end

  create_table "prefecs", force: :cascade do |t|
    t.integer "area_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "citytop_img"
    t.string "citytop_name"
    t.string "newshop_img1"
    t.string "newshop_name1"
    t.string "newshop_img2"
    t.string "newshop_name2"
    t.string "newshop_img3"
    t.string "newshop_name3"
    t.string "newshop_img4"
    t.string "newshop_name4"
    t.string "newshop_img5"
    t.string "newshop_name5"
    t.string "newshop_img6"
    t.string "newshop_name6"
    t.string "newshop_img7"
    t.string "newshop_name7"
    t.string "newshop_img8"
    t.string "newshop_name8"
    t.string "newshop_img9"
    t.string "newshop_name9"
    t.string "newshop_img10"
    t.string "newshop_name10"
    t.string "adshop_img1"
    t.string "adshop_name1"
    t.string "adshop_img2"
    t.string "adshop_name2"
    t.string "adshop_img3"
    t.string "adshop_name3"
    t.string "adshop_img4"
    t.string "adshop_name4"
    t.string "adshop_img5"
    t.string "adshop_name5"
    t.string "adshop_img6"
    t.string "adshop_name6"
    t.string "adshop_img7"
    t.string "adshop_name7"
    t.string "adshop_img8"
    t.string "adshop_name8"
    t.string "adshop_img9"
    t.string "adshop_name9"
    t.string "adshop_img10"
    t.string "adshop_name10"
    t.string "newshop_url1"
    t.string "newshop_url2"
    t.string "newshop_url3"
    t.string "newshop_url4"
    t.string "newshop_url5"
    t.string "newshop_url6"
    t.string "newshop_url7"
    t.string "newshop_url8"
    t.string "newshop_url9"
    t.string "newshop_url10"
    t.string "adshop_url1"
    t.string "adshop_url2"
    t.string "adshop_url3"
    t.string "adshop_url4"
    t.string "adshop_url5"
    t.string "adshop_url6"
    t.string "adshop_url7"
    t.string "adshop_url8"
    t.string "adshop_url9"
    t.string "adshop_url10"
    t.index ["area_id"], name: "index_prefecs_on_area_id"
  end

  create_table "pubimgs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "ashop_id"
    t.string "topimg"
    t.string "foodname1"
    t.string "foodname2"
    t.string "price"
    t.string "foodimg1"
    t.string "foodimg2"
    t.string "foodimg3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ashop_id"], name: "index_pubimgs_on_ashop_id"
    t.index ["user_id"], name: "index_pubimgs_on_user_id"
  end

  create_table "pubmenus", force: :cascade do |t|
    t.integer "ashop_id"
    t.integer "user_id"
    t.string "name"
    t.string "img1"
    t.string "img2"
    t.string "img3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ashop_id"], name: "index_pubmenus_on_ashop_id"
    t.index ["user_id"], name: "index_pubmenus_on_user_id"
  end

  create_table "tops", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "accepted", default: false, null: false
    t.integer "role", default: 2, null: false
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
