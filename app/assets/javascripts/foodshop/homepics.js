 //= require jquery
//= require rails-ujs
//= require activestorage


$(function() {
    // jQuery Upload Thumbs 
    $('#upload1').uploadThumbs({
        position : '#preview1',   // any: arbitrarily jquery selector
    });
    $('#upload2').uploadThumbs({
        position : '#preview2',   // any: arbitrarily jquery selector
    });
    $('#upload3').uploadThumbs({
        position : '#preview3',   // any: arbitrarily jquery selector
    });
});
