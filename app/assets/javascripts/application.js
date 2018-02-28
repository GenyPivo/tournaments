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
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require_tree .

var exitClasses = 'exit red';
var participateClasses = 'participate blue';

$(document).on('click', '.exit', function () {
  var _this = $(this);
  var tid = $(this).data().tid;

  $.ajax({
    type: "POST",
    url: "/tournaments/exit",
    data: "id=" + tid,
    success: function(msg){
      _this.removeClass(exitClasses);
      _this.addClass(participateClasses);
      _this.text('Participate');
      var count = $('.count[data-count=' + tid + ']');
      count.text(parseInt(count.text()) - 1);
    }
  });
});

$(document).on('click', '.participate', function () {

  var _this = $(this);
  var tid = $(this).data().tid;

  $.ajax({
    type: "POST",
    url: "/tournaments/participate",
    data: "id=" + tid,
    success: function () {
      _this.removeClass(participateClasses);
      _this.addClass(exitClasses);
      _this.text('Exit');
      var count = $('.count[data-count=' + tid + ']');
      count.text(parseInt(count.text()) + 1);
    }
  });
});
