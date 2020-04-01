Rails.application.routes.draw do

resources :pubimgs
resources :pubmenus

  
get 'welcome/index'
  
root 'welcome#index'


devise_for :admin_users, ActiveAdmin::Devise.config
ActiveAdmin.routes(self)
  

devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords"
}


resources :welcome do
    collection do
      get "video", "allf9", "usage", "sitemap", "mail", "aboutus", "code", "respon", "pp"
end end



resources :users do
    collection do
      get "profile", "myshop", "mywallet"
end end



namespace :myashop do resources :myashops do

    member do
      get "contact", "access", "time", "info"
      get "home_edit", "img_edit", "contact_edit", "access_edit", "time_edit", "info_edit"
    end

    collection do
      get "home_new", "img_new"

end end end

namespace :myashop do resources :myashops do
                      resources :myamenucs
end end

namespace :myashop do resources :myamenucs do
                      resources :myamenus
end end

namespace :myashop do resources :myamenus do
                      resources :myfoods do
    member do
      get "foodimg"
    end
end end end

namespace :myashop do resources :myashops do
                      resources :myasmenucs
end end

namespace :myashop do resources :myasmenucs do
                      resources :myasmenus do
    member do
      get "menuline"
    end
end end end

namespace :myashop do resources :myashops do
                      resources :myadmenucs
end end

namespace :myashop do resources :myadmenucs do
                      resources :myadmenus
end end

namespace :myashop do resources :myadmenus do
                      resources :mydrinks
end end

namespace :myashop do resources :myashops do
                      resources :myatmenucs
end end

namespace :myashop do resources :myatmenucs do
                      resources :myatmenus
end end

namespace :myashop do resources :myatmenus do
                      resources :myatakeouts
end end


namespace :mybshop do resources :mybshops do

    member do
      get "contact", "access", "time", "info"
      get "home_edit", "img_edit", "contact_edit", "access_edit", "time_edit", "info_edit"
    end

    collection do
      get "home_new", "img_new"

end end end

namespace :mybshop do resources :mybshops do
                      resources :mybmenucs do
      member do
        get "subedit"
      end
end end end

namespace :mybshop do resources :mybshops do
                      resources :mybsmenucs do
      member do
        get "subedit"
      end
end end end

namespace :mybshop do resources :mybshops do
                      resources :mybequipcs do
      member do
        get "subedit"
      end
end end end

namespace :mybshop do resources :mybequipcs do
                      resources :mybequips do
        member do
          get "equip_img"
        end
end end end

namespace :mybshop do resources :mybshops do
                      resources :mybstaffcs do
end end end

namespace :mybshop do resources :mybstaffcs do
                      resources :mybstaffs do
      member do
        get "staff_img"
      end
end end end

namespace :mycshop do resources :mycshops do

    member do
      get "contact", "access", "time", "info"
      get "home_edit", "img_edit", "contact_edit", "access_edit", "time_edit", "info_edit"
    end

    collection do
      get "home_new", "img_new"

end end end

namespace :mycshop do resources :mycshops do
                      resources :mycmenucs do
    member do
      get "subedit"
    end
end end end

namespace :mycshop do resources :mycshops do
                      resources :mycsmenucs do
    member do
      get "subedit"
    end
end end end

namespace :mycshop do resources :mycshops do
                      resources :mycequipcs do
    member do
      get "subedit"
    end
end end end

namespace :mycshop do resources :mycequipcs do
                      resources :mycequips do
    member do
      get "equip_img"
    end
end end end

namespace :mycshop do resources :mycshops do
                      resources :mycstaffcs do
end end end

namespace :mycshop do resources :mycstaffcs do
                      resources :mycstaffs do
    member do
      get "staff_img"
    end
end end end

namespace :mydshop do resources :mydshops do

    member do
      get "contact", "access", "time", "info"
      get "home_edit", "img_edit", "contact_edit", "access_edit", "time_edit", "info_edit"
    end

    collection do
      get "home_new", "img_new"

end end end

namespace :mydshop do resources :mydshops do
                      resources :mydmenucs
end end

namespace :mydshop do resources :mydmenucs do
                      resources :mydmenus
end end

namespace :mydshop do resources :mydmenus do
                      resources :myautos do
    member do
      get "auto_img"
    end
end end end

namespace :mydshop do resources :mydshops do
                      resources :mydsmenucs do
    member do
      get "subedit"
    end
end end end

namespace :mydshop do resources :mydshops do
                      resources :mydequipcs do
    member do
      get "subedit"
    end
end end end

namespace :mydshop do resources :mydequipcs do
                      resources :mydequips do
    member do
      get "equip_img"
    end
end end end

namespace :mydshop do resources :mydshops do
                      resources :mydstaffcs do
end end end

namespace :mydshop do resources :mydstaffcs do
                      resources :mydstaffs do
    member do
      get "staff_img"
    end
end end end


namespace :myeshop do resources :myeshops do

    member do
      get "contact", "access", "time", "info"
      get "home_edit", "img_edit", "contact_edit", "access_edit", "time_edit", "info_edit"
    end

    collection do
      get "home_new", "img_new"

end end end

namespace :myeshop do resources :myeshops do
                      resources :myemenucs
end end

namespace :myeshop do resources :myemenucs do
  resources :myemenus
end end

namespace :myeshop do resources :myemenus do
                      resources :myouts do
      member do
       get "out_img"
      end
end end end

namespace :myeshop do resources :myeshops do
                      resources :myesmenucs do
      member do
        get "subedit"
      end
end end end

namespace :myeshop do resources :myeshops do
                      resources :myeequipcs do
      member do
        get "subedit"
      end
end end end

namespace :myeshop do resources :myeequipcs do
                      resources :myeequips do
      member do
        get "equip_img"
      end
end end end

namespace :myeshop do resources :myeshops do
                      resources :myestaffcs do
end end end

namespace :myeshop do resources :myestaffcs do
                      resources :myestaffs do
      member do
        get "staff_img"
      end
end end end


namespace :myfshop do resources :myfshops do

    member do
      get "contact", "access", "time", "info"
      get "home_edit", "img_edit", "contact_edit", "access_edit", "time_edit", "info_edit"
    end

    collection do
      get "home_new", "img_new"

end end end

namespace :myfshop do resources :myfshops do
                      resources :myfmenucs do
      member do
        get "subedit"
      end
end end end

namespace :myfshop do resources :myfshops do
                      resources :myfsmenucs do
      member do
        get "subedit"
      end
end end end

namespace :myfshop do resources :myfshops do
                      resources :myfequipcs do
      member do
        get "subedit"
      end
end end end

namespace :myfshop do resources :myfequipcs do
                      resources :myfequips do
      member do
        get "equip_img"
      end
end end end

namespace :myfshop do resources :myfshops do
                      resources :myfstaffcs do
end end end

namespace :myfshop do resources :myfstaffcs do
                      resources :myfstaffs do
      member do
        get "staff_img"
      end
end end end

namespace :mygshop do resources :mygshops do

    member do
      get "contact", "access", "time", "info"
      get "home_edit", "img_edit", "contact_edit", "access_edit", "time_edit", "info_edit"
    end

    collection do
      get "home_new", "img_new"

end end end

namespace :mygshop do resources :mygshops do
                      resources :mygmenucs do
      member do
        get "subedit"
      end
end end end

namespace :mygshop do resources :mygshops do
                      resources :mygsmenucs do
      member do
        get "subedit"
      end
end end end

namespace :mygshop do resources :mygshops do
                      resources :mygequipcs do
      member do
        get "subedit"
      end
end end end

namespace :mygshop do resources :mygequipcs do
                      resources :mygequips do
      member do
        get "equip_img"
      end
end end end

namespace :mygshop do resources :mygshops do
                      resources :mygstaffcs do
end end end

namespace :mygshop do resources :mygstaffcs do
                      resources :mygstaffs do
        member do
          get "staff_img"
        end
end end end

namespace :myhshop do resources :myhshops do

    member do
      get "contact", "access", "time", "info"
      get "home_edit", "img_edit", "contact_edit", "access_edit", "time_edit", "info_edit"
    end

    collection do
      get "home_new", "img_new"

end end end

namespace :myhshop do resources :myhshops do
                      resources :myhmenucs
end end

namespace :myhshop do resources :myhmenucs do
                      resources :myhmenus
end end

namespace :myhshop do resources :myhmenus do
                      resources :myitems do
      member do
        get "item_img"
      end
end end end

namespace :myhshop do resources :myhshops do
                      resources :myhsmenucs do
      member do
        get "subedit"
      end
end end end

namespace :myhshop do resources :myhshops do
                      resources :myhequipcs do
      member do
        get "subedit"
      end
end end end

namespace :myhshop do resources :myhequipcs do
                      resources :myhequips do
      member do
        get "equip_img"
      end
end end end

namespace :myhshop do resources :myhshops do
                      resources :myhstaffcs do
end end end

namespace :myhshop do resources :myhstaffcs do
                      resources :myhstaffs do
      member do
        get "staff_img"
      end
end end end



resources :acategories

resources :bcategories

resources :ccategories

resources :dcategories

resources :ecategories

resources :fcategories

resources :gcategories

resources :hcategories



resources :tops do
    resources :areas
end



resources :areas do
    resources :prefecs do
    member do
      get "topad", "newad", "recomad"
    end
end end



resources :prefecs do 
    namespace :ashop do resources :ashops do

    member do
      get "contact", "access", "time", "info", "pub"
    end

end end end

namespace :ashop do resources :ashops do
                    resources :pubmenus
end end

namespace :ashop do resources :ashops do
                    resources :pubimgs
end end

namespace :ashop do resources :ashops do
                    resources :amenucs
end end

namespace :ashop do resources :amenucs do
                    resources :amenus
end end

namespace :ashop do resources :amenus do
                    resources :foods do
end end end

namespace :ashop do resources :ashops do
                    resources :asmenucs
end end

namespace :ashop do resources :asmenucs do
                    resources :asmenus do
end end end

namespace :ashop do resources :ashops do
                    resources :admenucs
end end

namespace :ashop do resources :admenucs do
                    resources :admenus
end end

namespace :ashop do resources :admenus do
                    resources :drinks
end end

namespace :ashop do resources :ashops do
                    resources :atmenucs
end end

namespace :ashop do resources :atmenucs do
                    resources :atmenus
end end

namespace :ashop do resources :atmenus do
                    resources :atakeouts
end end



resources :prefecs do 
    namespace :bshop do resources :bshops do

    member do
      get "contact", "access", "time", "info", "pub"
    end

end end end

namespace :bshop do resources :bshops do
                      resources :bmenucs
end end

namespace :bshop do resources :bshops do
                      resources :bsmenucs
end end



resources :prefecs do 
    namespace :cshop do resources :cshops do

    member do
      get "contact", "access", "time", "info", "pub"
    end

end end end



resources :prefecs do 
    namespace :dshop do resources :dshops do

    member do
      get "contact", "access", "time", "info", "pub"
    end

end end end



resources :prefecs do 
    namespace :eshop do resources :eshops do

    member do
      get "contact", "access", "time", "info", "pub"
    end

end end end



resources :prefecs do 
    namespace :fshop do resources :fshops do

    member do
      get "contact", "access", "time", "info", "pub"
    end

end end end



resources :prefecs do 
    namespace :gshop do resources :gshops do

    member do
      get "contact", "access", "time", "info", "pub"
    end

end end end



resources :prefecs do 
    namespace :hshop do resources :hshops do

    member do
      get "contact", "access", "time", "info", "pub"
    end

end end end



namespace :asearch do resources :asshops do

  member do
      get "contact", "access", "time", "info", "pub"
    end

end end

namespace :asearch do resources :asshops do
                      resources :pubmenus
end end

namespace :asearch do resources :asshops do
                      resources :pubimgs
end end

namespace :asearch do resources :asshops do
                      resources :asmenucs
end end

namespace :asearch do resources :asmenucs do
                      resources :asmenus
end end

namespace :asearch do resources :asmenus do
                      resources :sfoods do
end end end

namespace :asearch do resources :asshops do
                      resources :assmenucs
end end

namespace :asearch do resources :assmenucs do
                      resources :assmenus do
    member do
      get "menuline"
    end
end end end

namespace :asearch do resources :assmenus do
                      resources :assub
end end

namespace :asearch do resources :asshops do
                      resources :adsmenucs
end end

namespace :asearch do resources :adsmenucs do
                      resources :adsmenus
end end

namespace :asearch do resources :adsmenus do
                      resources :sdrinks
end end

namespace :asearch do resources :asshops do
                      resources :atsmenucs
end end

namespace :asearch do resources :atsmenucs do
                      resources :atsmenus
end end

namespace :asearch do resources :atsmenus do
                      resources :astakeouts
end end



namespace :bsearch do resources :bsshops do

  member do
      get "contact", "access", "time", "info", "pub"
    end

end end

namespace :bsearch do resources :bsshops do
                      resources :bsmenucs
end end

namespace :bsearch do resources :bsshops do
                      resources :bssmenucs
end end

namespace :bsearch do resources :bsshops do
                      resources :bsequipcs
end end

namespace :bsearch do resources :bsequipcs do
                      resources :bsequips
end end

namespace :bsearch do resources :bsshops do
                      resources :bsstaffcs
end end

namespace :bsearch do resources :bsstaffcs do
                      resources :bsstaffs
end end



namespace :csearch do resources :csshops do

  member do
      get "contact", "access", "time", "info", "pub"
    end

end end

namespace :csearch do resources :csshops do
                      resources :csmenucs
end end

namespace :csearch do resources :csshops do
                      resources :cssmenucs
end end

namespace :csearch do resources :csshops do
                      resources :csequipcs
end end

namespace :csearch do resources :csequipcs do
                      resources :csequips
end end

namespace :csearch do resources :csshops do
                      resources :csstaffcs
end end

namespace :csearch do resources :csstaffcs do
                      resources :csstaffs
end end



namespace :dsearch do resources :dsshops do

  member do
      get "contact", "access", "time", "info", "pub"
    end

end end

namespace :dsearch do resources :dsshops do
                      resources :dsmenucs
end end

namespace :dsearch do resources :dsmenucs do
                      resources :dsmenus
end end

namespace :dsearch do resources :dsmenus do
                      resources :sautos do
end end end

namespace :dsearch do resources :dsshops do
                      resources :dssmenucs
end end

namespace :dsearch do resources :dsshops do
                      resources :dsequipcs
end end

namespace :dsearch do resources :dsequipcs do
                      resources :dsequips
end end

namespace :dsearch do resources :dsshops do
                      resources :dsstaffcs
end end

namespace :dsearch do resources :dsstaffcs do
                      resources :dsstaffs
end end



namespace :esearch do resources :esshops do

  member do
      get "contact", "access", "time", "info", "pub"
    end

end end

namespace :esearch do resources :esshops do
                      resources :esmenucs
end end

namespace :esearch do resources :esmenucs do
                      resources :esmenus
end end

namespace :esearch do resources :esmenus do
                      resources :souts do
end end end

namespace :esearch do resources :esshops do
                      resources :essmenucs
end end

namespace :esearch do resources :esshops do
                      resources :esequipcs
end end

namespace :esearch do resources :esequipcs do
                      resources :esequips
end end

namespace :esearch do resources :esshops do
                      resources :esstaffcs
end end

namespace :esearch do resources :esstaffcs do
                      resources :esstaffs
end end



namespace :fsearch do resources :fsshops do

  member do
      get "contact", "access", "time", "info", "pub"
    end

end end

namespace :fsearch do resources :fsshops do
                      resources :fsmenucs
end end

namespace :fsearch do resources :fsshops do
                      resources :fssmenucs
end end

namespace :fsearch do resources :fsshops do
                      resources :fsequipcs
end end

namespace :fsearch do resources :fsequipcs do
                      resources :fsequips
end end

namespace :fsearch do resources :fsshops do
                      resources :fsstaffcs
end end

namespace :fsearch do resources :fsstaffcs do
                      resources :fsstaffs
end end



namespace :gsearch do resources :gsshops do

  member do
      get "contact", "access", "time", "info", "pub"
    end

end end

namespace :gsearch do resources :gsshops do
                      resources :gsmenucs
end end

namespace :gsearch do resources :gsshops do
                      resources :gssmenucs
end end

namespace :gsearch do resources :gsshops do
                      resources :gsequipcs
end end

namespace :gsearch do resources :gsequipcs do
                      resources :gsequips
end end

namespace :gsearch do resources :gsshops do
                      resources :gsstaffcs
end end

namespace :gsearch do resources :gsstaffcs do
                      resources :gsstaffs
end end



namespace :hsearch do resources :hsshops do

  member do
      get "contact", "access", "time", "info", "pub"
    end

end end

namespace :hsearch do resources :hsshops do
                      resources :hsmenucs
end end

namespace :hsearch do resources :hsmenucs do
                      resources :hsmenus
end end

namespace :hsearch do resources :hsmenus do
                      resources :sitems do
end end end

namespace :hsearch do resources :hsshops do
                      resources :hssmenucs
end end

namespace :hsearch do resources :hsshops do
                      resources :hsequipcs
end end

namespace :hsearch do resources :hsequipcs do
                      resources :hsequips
end end

namespace :hsearch do resources :hsshops do
                      resources :hsstaffcs
end end

namespace :hsearch do resources :hsstaffcs do
                      resources :hsstaffs
end end



Rails.application.routes.draw do
  resources :pubimgs
  resources :pubmenus
  get 'inquiry' => 'inquiry#index'              # 入力画面
  post 'inquiry/confirm' => 'inquiry#confirm'   # 確認画面
  post 'inquiry/thanks' => 'inquiry#thanks'     # 送信完了画面
end

Rails.application.routes.draw do
  resources :pubimgs
  resources :pubmenus
  get  'index' =>'messages#index'
  post 'confirm' => 'messages#confirm'
  post 'done' => 'messages#done'
end

end