(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.Publications = App.Controller.Page.extend({

    options: {
      sliderContentCardType: "card",
      sliderMediaItemType: "related-media"
    },

    index: function() {
      if($('.masonry-layout').find('.masonry-column').length === 0) {
        new App.View.Masonry({
          el: '.masonry-layout'
        });
      }
      new App.View.MediaFilters({
        callback: this._filter.bind(this)
      });
    },

    show: function() {
      new App.View.DescriptionView({
        el: '.content-wrapper'
      });
      new App.View.RelatedMedia();

      this.initSliders();
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

    _filter: function() {
      jQuery.ajaxSetup({cache: true});
      $.getScript($(location).attr('href'));
      return false;
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
            enableMouseEvents: true
          });
        }
      }.bind(this));
    }

  });

})(this.App);
