// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery_ujs

function() {
    return function() {
      var areas;
      areas = $('#ashop_area_id').html();
      console.log(areas);
      return $('#ashop_top_id').change(function() {
        var options, top;
        top = $('#ashop_top_id :selected').text();
        options = $(areas).filter("optgroup[label=" + top + "]").html();
        console.log(options);
        if (options) {
          return $('#ashop_area_id').html(options);
        } else {
          return $('#ashop_area_id').empty();
        }
      });
    };
  })(this));

}).call(this);

function() {
    return function() {
      var prefecs;
      prefecs = $('#ashop_prefec_id').html();
      console.log(prefecs);
      return $('#ashop_area_id').change(function() {
        var options, area;
        area = $('#ashop_area_id :selected').text();
        options = $(prefecs).filter("optgroup[label=" + area + "]").html();
        console.log(options);
        if (options) {
          return $('#ashop_prefec_id').html(options);
        } else {
          return $('#ashop_prefec_id').empty();
        }
      });
    };
  })(this));

}).call(this);