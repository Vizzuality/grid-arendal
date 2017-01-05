(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.Search = App.Controller.Page.extend({

    index: function() {
      if(this.isScreen_s) {
        this.initSliders();
      } else {
        if($('.masonry-layout').find('.masonry-column').length === 0) {
          _.each($('.masonry-layout'), function(element) {
            new App.View.Masonry({
              el: element
            });
          });
        }
      }
    },

    initSliders: function() {
      _.each($('.js_slider'), function(element) {
        lory(element, {
          enableMouseEvents: true
        });
      }.bind(this));
    }

  });

})(this.App);