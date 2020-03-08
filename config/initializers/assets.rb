# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

Rails.application.config.assets.precompile += %w( ashops.js )
Rails.application.config.assets.precompile += %w( welcome.js )
Rails.application.config.assets.precompile += %w( city.js )
Rails.application.config.assets.precompile += %w( shop.js )
Rails.application.config.assets.precompile += %w( food.js )
Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( jquery.uploadThumbs.js )
Rails.application.config.assets.precompile += %w( slick.min.js )
Rails.application.config.assets.precompile += %w( slick.js )
Rails.application.config.assets.precompile += %w( flickity.pkgd.min.js )
Rails.application.config.assets.precompile += %w( flickity.pkgd.js )
Rails.application.config.assets.precompile += %w( modal.js )
Rails.application.config.assets.precompile += %w( shop/slick.min.js )
Rails.application.config.assets.precompile += %w( shop/slick.js )
Rails.application.config.assets.precompile += %w( foodshop/homepics.js )
Rails.application.config.assets.precompile += %w( edit/foodshop.js )
Rails.application.config.assets.precompile += %w( foodshop/edit/jquery.simplePagination.js )
Rails.application.config.assets.precompile += %w( drawer.js )
Rails.application.config.assets.precompile += %w( drawer.min.js )
Rails.application.config.assets.precompile += %w( iscroll.js )

Rails.application.config.assets.precompile += %w( welcome.css )
Rails.application.config.assets.precompile += %w( top.css )
Rails.application.config.assets.precompile += %w( areas.css )
Rails.application.config.assets.precompile += %w( city.css )
Rails.application.config.assets.precompile += %w( comic.css )
Rails.application.config.assets.precompile += %w( modal.css )
Rails.application.config.assets.precompile += %w( selecter.css )
Rails.application.config.assets.precompile += %w( mypage.css )
Rails.application.config.assets.precompile += %w( myshop.css )
Rails.application.config.assets.precompile += %w( profile.css )
Rails.application.config.assets.precompile += %w( buylist.css )
Rails.application.config.assets.precompile += %w( accard.css )
Rails.application.config.assets.precompile += %w( paycard.css )
Rails.application.config.assets.precompile += %w( social.css )
Rails.application.config.assets.precompile += %w( drawer.css)
Rails.application.config.assets.precompile += %w( drawer.min.css )
Rails.application.config.assets.precompile += %w( bottom_navi.css )


Rails.application.config.assets.precompile += %w( shop/shop.css )
Rails.application.config.assets.precompile += %w( shop/ashop/mcategory.css )

Rails.application.config.assets.precompile += %w( user/login.css )
Rails.application.config.assets.precompile += %w( user/password.css )
Rails.application.config.assets.precompile += %w( user/registration.css )

#skick
Rails.application.config.assets.precompile += %w( slick/slick.css )
Rails.application.config.assets.precompile += %w( slick/slick-theme.css )
Rails.application.config.assets.precompile += %w( slick/flickity.css )
Rails.application.config.assets.precompile += %w( slick/flickity.min.css )
Rails.application.config.assets.precompile += %w( slick/prefec/slick.css )
Rails.application.config.assets.precompile += %w( slick/prefec/slick-theme.css )
Rails.application.config.assets.precompile += %w( slick/city/slick.css )
Rails.application.config.assets.precompile += %w( slick/city/slick-theme.css )
Rails.application.config.assets.precompile += %w( slick/shop/slick.css )
Rails.application.config.assets.precompile += %w( slick/shop/slick-theme.css )
Rails.application.config.assets.precompile += %w( slick/top/slick.css )
Rails.application.config.assets.precompile += %w( slick/top/slick-theme.css )
Rails.application.config.assets.precompile += %w( slick/info/slick.css )
Rails.application.config.assets.precompile += %w( slick/info/slick-theme.css )


Rails.application.config.assets.precompile += %w( search/asearch.css )

Rails.application.config.assets.precompile += %w( creater/foodshop.css )
Rails.application.config.assets.precompile += %w( creater/foodmenu.css )
Rails.application.config.assets.precompile += %w( creater/foods.css )
Rails.application.config.assets.precompile += %w( creater/ashop.css )
Rails.application.config.assets.precompile += %w( creater/ashop/home.css )
Rails.application.config.assets.precompile += %w( creater/ashop/contact.css )
Rails.application.config.assets.precompile += %w( creater/ashop/access.css )
Rails.application.config.assets.precompile += %w( creater/ashop/info.css )
Rails.application.config.assets.precompile += %w( creater/ashop/time.css )
Rails.application.config.assets.precompile += %w( creater/ashop/mcategory.css )
Rails.application.config.assets.precompile += %w( creater/ashop/menu.css )
Rails.application.config.assets.precompile += %w( creater/ashop/food.css )
Rails.application.config.assets.precompile += %w( creater/ashop/drink.css )
Rails.application.config.assets.precompile += %w( creater/ashop/special.css )
Rails.application.config.assets.precompile += %w( creater/ashop/topping.css )
Rails.application.config.assets.precompile += %w( creater/ashop/manga.css )
Rails.application.config.assets.precompile += %w( creater/ashop/pay.css )

Rails.application.config.assets.precompile += %w( footers/video.css )
Rails.application.config.assets.precompile += %w( footers/aaf9.css )
Rails.application.config.assets.precompile += %w( footers/usage.css )
Rails.application.config.assets.precompile += %w( footers/smap.css )
Rails.application.config.assets.precompile += %w( footers/mail.css )
Rails.application.config.assets.precompile += %w( footers/aboutus.css )
Rails.application.config.assets.precompile += %w( footers/code.css )
Rails.application.config.assets.precompile += %w( footers/respon.css )
Rails.application.config.assets.precompile += %w( footers/pp.css )

Rails.application.config.assets.precompile += %w( inquiry/submit.css )
Rails.application.config.assets.precompile += %w( inquiry/confirm.css )
Rails.application.config.assets.precompile += %w( inquiry/done.css )


#template
Rails.application.config.assets.precompile += %w( temp/ad.css )
Rails.application.config.assets.precompile += %w( temp/header.css )
Rails.application.config.assets.precompile += %w( temp/sheader.css )
Rails.application.config.assets.precompile += %w( temp/uheader.css )
Rails.application.config.assets.precompile += %w( temp/mnavi.css )
Rails.application.config.assets.precompile += %w( temp/secondf.css )
Rails.application.config.assets.precompile += %w( temp/footer.css )

#info
Rails.application.config.assets.precompile += %w( temp/info/page.css )
Rails.application.config.assets.precompile += %w( temp/info/uheader.css )
Rails.application.config.assets.precompile += %w( temp/info/uheader2.css )

#top
Rails.application.config.assets.precompile += %w( temp/top/secondf.css )

#city
Rails.application.config.assets.precompile += %w( temp/city/main-navi.css )
Rails.application.config.assets.precompile += %w( temp/city/secondf.css )

#gourmet
Rails.application.config.assets.precompile += %w( temp/shop/page.css )
Rails.application.config.assets.precompile += %w( temp/shop/uheader.css )
Rails.application.config.assets.precompile += %w( temp/shop/uheader2.css )
Rails.application.config.assets.precompile += %w( temp/shop/mnavi.css )
Rails.application.config.assets.precompile += %w( temp/shop/sfeature.css )



#飲食店
Rails.application.config.assets.precompile += %w( shophome/home.css )
Rails.application.config.assets.precompile += %w( shophome/ashop/foods.css )
Rails.application.config.assets.precompile += %w( shophome/ashop/each.css )
Rails.application.config.assets.precompile += %w( shophome/ashop/drink.css )
Rails.application.config.assets.precompile += %w( shophome/ashop/content/access.css )
Rails.application.config.assets.precompile += %w( shophome/ashop/content/time.css )
Rails.application.config.assets.precompile += %w( shophome/ashop/content/contact.css )
Rails.application.config.assets.precompile += %w( shophome/ashop/content/menu.css )
Rails.application.config.assets.precompile += %w( shophome/ashop/content/special.css )
Rails.application.config.assets.precompile += %w( shophome/ashop/content/takeout.css )
Rails.application.config.assets.precompile += %w( shophome/ashop/content/info.css )

#病院
Rails.application.config.assets.precompile += %w( shophome/bshop/equip.css )
Rails.application.config.assets.precompile += %w( shophome/bshop/staff.css )
Rails.application.config.assets.precompile += %w( shophome/bshop/each_equip.css )
Rails.application.config.assets.precompile += %w( shophome/bshop/each_staff.css )

#info
Rails.application.config.assets.precompile += %w( shophome/info/home.css )
Rails.application.config.assets.precompile += %w( shophome/info/content/principle.css )
Rails.application.config.assets.precompile += %w( shophome/info/content/others.css )
Rails.application.config.assets.precompile += %w( shophome/info/content/contact.css )
Rails.application.config.assets.precompile += %w( shophome/info/content/service.css )
Rails.application.config.assets.precompile += %w( shophome/info/content/usage.css )

