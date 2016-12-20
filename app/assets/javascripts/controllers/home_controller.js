(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.Home = App.Controller.Page.extend({

    options: {
      sliderContentCardType: "card",
      sliderMediaItemType: "related-media"
    },

    index: function() {
      new App.View.EventsModal();
      $('.l-main-content').addClass('home');
      $('.cta-mobile').addClass('home');
      $('.footer-slider').addClass('home');

      this.initSliders();
      if(!this.isScreen_s) {
        _.each($('.masonry-layout'), function(element) {
          new App.View.Masonry({
            el: element
          });
        });
      }
    },

    initSliders: function() {
      _.each($('.js_slider'), function(element) {
        var sliderType = $(element).data("slider-type");
        var needLoadSlider = true;

        if(sliderType == this.options.sliderContentCardType && !this.isScreen_s) {
          needLoadSlider = false;
        }

        if(needLoadSlider) {
          lory(element, {
            rewind: true,
            enableMouseEvents: true
          });
        }
      }.bind(this));
    }

  });


})(this.App);
