(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.Home = App.Controller.Page.extend({

    index: function() {
      var eventsModalView = new App.View.EventsModal();
      $('.l-main-content').addClass('home');
      $('.cta-mobile').addClass('home');
      $('.footer-slider').addClass('home');

      if(this.isScreen_s) {
        this.initSliders();
      } else {
        _.each($('.masonry-layout'), function(element) {
          if($(element).find('.masonry-column').length === 0) {
            new App.View.Masonry({
              el: element
            });
          }
        });
      }
    },

    initSliders: function() {
      _.each(document.querySelectorAll('.js_slider'), function(element) {
        lory(element, {
          rewind: true,
          enableMouseEvents: true
        });
      });
    }

  });


})(this.App);
