//= require jquery
//= require rails-ujs
//= require activestorage


$(document).ready(function(){
    $('.slider').slick({
        dots:true,
        arrows:false,
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
  

   $(function() {
  return (function() {
    var replaceChildrenOptions, replaceSelectOptions;
    replaceSelectOptions = function($select, results) {
      $select.html($('<option>'));
      return $.each(results, function() {
        var option;
        option = $('<option>').val(this.id).text(this.name);
        return $select.append(option);
      });
    };
    replaceChildrenOptions = function() {
      var $selectChildren, childrenPath;
      childrenPath = $(this).find('option:selected').data().childrenPath;
      $selectChildren = $(this).closest('form').find('.select-children');
      if (childrenPath != null) {
        return $.ajax({
          url: childrenPath,
          dataType: "json",
          success: function(results) {
            return replaceSelectOptions($selectChildren, results);
          },
          error: function(XMLHttpRequest, textStatus, errorThrown) {
            console.error("Error occurred in replaceChildrenOptions");
            console.log("XMLHttpRequest: " + XMLHttpRequest.status);
            console.log("textStatus: " + textStatus);
            return console.log("errorThrown: " + errorThrown);
          }
        });
      } else {
        return replaceSelectOptions($selectChildren, []);
      }
    };
    return $('.select-parent').on({
      'change': replaceChildrenOptions
    });
  })();
});