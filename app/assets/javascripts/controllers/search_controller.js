(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.Search = App.Controller.Page.extend({

    index: function() {
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
      _.each($('.js_slider'), function(element) {
        lory(element, {
          enableMouseEvents: true
        }).slideTo(1);
      }.bind(this));
    }

  });

})(this.App);
