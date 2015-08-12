// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require fullcalendar
//= require jquery
//= require jquery_ujs
// = require turbolinks
// = require_tree


$(document).ready(function() {
  $('#notice').delay(5000).slideUp();
  $( '#tableT' ).hide();
  $( '#tableC' ).hide();
  $( '#showT' ).removeClass('btnSelect');
  $( '#showC' ).removeClass('btnSelect');
  if (window.matchMedia('(max-width: 767px)').matches) {
            $( '#showA' ).animate({height: '45px'});

    } else {
            $( '#showA' ).animate({height: '55px'});

    }

  $( '.btnZ' ).hover(function() {
      $(this).animate({

      });
  });



  $( '#showA' ).click(function() {
          $( '#tableT' ).hide();
          $( '#tableC' ).hide();
          $( '#tableA' ).show();
          $( '#showA' ).addClass('btnSelect');
          $( '#showT' ).removeClass('btnSelect');
          $( '#showC' ).removeClass('btnSelect');
          if (window.matchMedia('(max-width: 767px)').matches) {
                    $(this).animate({height: '45px'});
                    $( '#showT' ).animate({height: '40px'});
                    $( '#showC' ).animate({height: '40px'});
            } else {
                    $(this).animate({height: '55px'});
                    $( '#showT' ).animate({height: '50px'});
                    $( '#showC' ).animate({height: '50px'});
            }

  });


  $( '#showT' ).click(function() {
          $( '#tableA' ).hide();
          $( '#tableC' ).hide();
          $( '#tableT').show();
          $( '#showT' ).addClass('btnSelect');
          $( '#showA' ).removeClass('btnSelect');
          $( '#showC' ).removeClass('btnSelect');
          if (window.matchMedia('(max-width: 767px)').matches) {
                    $(this).animate({height: '45px'});
                    $( '#showA' ).animate({height: '40px'});
                    $( '#showC' ).animate({height: '40px'});
            } else {
                    $(this).animate({height: '55px'});
                    $( '#showA' ).animate({height: '50px'});
                    $( '#showC' ).animate({height: '50px'});
            }

  });

  $( '#showC' ).click(function() {
          $( '#tableT' ).hide();
          $( '#tableA' ).hide();
          $( '#tableC').show();
          $( '#showC' ).addClass('btnSelect');
          $( '#showT' ).removeClass('btnSelect');
          $( '#showA' ).removeClass('btnSelect');
          if (window.matchMedia('(max-width: 767px)').matches) {
                    $(this).animate({height: '45px'});
                    $( '#showA' ).animate({height: '40px'});
                    $( '#showT' ).animate({height: '40px'});
            } else {
                    $(this).animate({height: '55px'});
                    $( '#showA' ).animate({height: '50px'});
                    $( '#showT' ).animate({height: '50px'});
            }
  });

  $("#availability_start_1i").datepicker({ minDate: 0 });


});
