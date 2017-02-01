(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.Users = App.Controller.Page.extend({

    options: {
      sliderContentCardType: "card"
    },

    show: function(params) {
      this.params = params;

      this.initSliders();

      new App.View.VideoPlayer();
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

      this._addListeners();
    },

    initSliders: function() {
      _.each($('.js_slider'), function(element) {
        if($(element).find(".js_slide").length > 0) {
          var sliderType = $(element).data("slider-type");
          var needLoadSlider = true;

          if (sliderType == this.options.sliderContentCardType && !this.isScreen_s) {
            needLoadSlider = false;
          }

          if (needLoadSlider) {
            var slider = lory(element, {
              enableMouseEvents: true,
              infinite: true
            });
            this.slider = slider;
          }
        }
      }.bind(this));
    },

    _addListeners: function() {
      $('.js-see-more').on('click', this._get_all_related_activities.bind(this));
    },

    _get_all_related_activities: function() {
      var url = '/staff/related_activities'

      $.ajax({
        method: "GET",
        cache: true,
        url: url,
        data: this.params,
        beforeSend: function() {
        }.bind(this),
        complete: function(response) {
        }.bind(this)
      });
    },

  });

})(this.App);
