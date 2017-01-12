(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.Users = App.Controller.Page.extend({

    options: {
      sliderContentCardType: "card"
    },

    show: function() {
      this.initSliders();

      new App.View.RelatedMedia({
        slider: this.slider
      });
      if(!this.isScreen_s) {
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
      _.each($('.js_slider'), function(element) {
        var sliderType = $(element).data("slider-type");
        var needLoadSlider = true;

        if(sliderType == this.options.sliderContentCardType && !this.isScreen_s) {
          needLoadSlider = false;
        }

        if(needLoadSlider) {
          var slider = lory(element, {
            enableMouseEvents: true,
            infinite: true
          });
          this.slider = slider;
        }
      }.bind(this));
    }

  });

})(this.App);
