//= require jquery
//= require rails-ujs
//= require activestorage

    $(function() {

       $('.search .stabs li').on('click', function() {

           //figure out which panel to show
           var panelToShow = $(this).attr('rel');

           //hide current panel
           $('.search .spanel.active').slideUp(300, function() {
               $(this).removeClass('active');

               $('#'+panelToShow).slideDown(300, function(){
                    $(this).addClass('active');
               });          
           });
        
        });

    }); 

   $(function() {

       $('.main-navi .tabs li').on('click', function() {

           //figure out which panel to show
           var panelToShow = $(this).attr('rel');

           //hide current panel
           $('.main-navi .panel.active').slideUp(300, function() {
               $(this).removeClass('active');

               $('#'+panelToShow).slideDown(300, function(){
                    $(this).addClass('active');
               });          
           });
        
        });

    });   


      $(document).ready(function(){
$('.slider').slick({
    dots:true,
    arrows:false,
    infinite: true,
    slidesToShow: 1,
    adaptiveHeight: true, 
});
      });
