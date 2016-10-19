(function(App) {

  'use strict';

  var MobileMenu = Backbone.View.extend({

    el: 'body',

    initialize: function() {
      $('html').removeClass('-menu-open');
      $('body').removeClass('-menu-open');
      $('.c-mobile-menu').removeClass('-is-open');
      $('.c-menu').removeClass('-is-open');
    },

    events: {
      'click .btn-mobile-menu' : 'toggleMenu',
      'click .btn-close' : 'toggleMenu'
    },

    toggleMenu: function() {
      $('html').toggleClass('-menu-open');
      $('body').toggleClass('-menu-open');
      $('.c-mobile-menu').toggleClass('-is-open');
      $('.c-menu').toggleClass('-is-open');
    }
  });

  var mobileMenu = new MobileMenu();

})(this.App);
