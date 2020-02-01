//= require jquery
//= require rails-ujs
//= require activestorage

var headerHeight = $('header').outerHeight();
$('#menu').css('margin-top', headerHeight + 'px');

// MENUボタンがクリックされたときの処理
$('#menu_btn').on('click', function(){
  if($(this).hasClass('active')) {
    $(this).removeClass('active');
    $(this).text('MENU');
    $('#menu').removeClass('open');
    $('.menu-background').removeClass('open');
  } else {
    $(this).addClass('active');
    $(this).text('CLOSE');
    $('#menu').addClass('open');
    $('.menu-background').addClass('open');
  }
});

// メニューの背景がクリックされたときの処理
$('.menu-background').on('click', function(){
  if($(this).hasClass('open')) {
    $(this).removeClass('open');
    $('#menu_btn').removeClass('active').text('MENU');
    $('#menu').removeClass('open');
  }
});

