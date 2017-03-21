(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.Search = App.Controller.Page.extend({

    index: function() {
      new App.View.SearchInput();
      new App.View.VideoThumbnails();

      var params = App.Helper.Utils.getGetParams();
      new App.View.Filters({
        options: {trackLabel: 'Search filters'},
        staticParams: typeof params['query'] !== "undefined" ? '&query=' + params['query'] : null
      });

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
        if($(element).find(".js_slide").length > 0) {
          lory(element, {
            enableMouseEvents: true
          }).slideTo(1);
        }
      }.bind(this));
    }

  });

})(this.App);
