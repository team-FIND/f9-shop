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

 $(function(){
  
       var width = 720;
       var animationSpeed = 2000;
       var pause = 2500;
       var currentSlide = 1;

       var $slider = $('#slider')
       var $slideContainer = $slider.find('.slides');
       var $slides = $slideContainer.find('.slide');

       var interval;
       
       function startSlider() {
           interval= setInterval(function() {
               $slideContainer.animate({'margin-left': '-='+width}, animationSpeed, function() {
                   currentSlide++;
                   if (currentSlide === $slides.length) {
                       currentSlide = 1;
                       $slideContainer.css('margin-left', 0);
                   }

               });
           }, pause);
       }

       function stopSlider() {
           clearInterval(interval);  
       }

      $slider.on('mouseenter' , stopSlider).on('mouseleave', startSlider);

      startSlider();

   });

 $(function(){
 $('.thumbnails img').click(function(){
  var $thisImg = $(this).attr('src');
  var $thisAlt = $(this).attr('alt');
  $('.mainImage img').attr({src:$thisImg,alt:$thisAlt});
 });
});