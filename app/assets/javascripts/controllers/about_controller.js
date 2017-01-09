(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.About = App.Controller.Page.extend({

    index: function() {
      new App.View.Anchors({});
      if(this.isScreen_s) {
        this.initSliders();
      } else {
        _.each($('.masonry-layout'), function(element) {
          if($('.masonry-layout').find('.masonry-column').length === 0) {
            new App.View.Masonry({
              el: element
            });
          }
        });
      }
    },

    initSliders: function() {
      Array.prototype.slice.call(document.querySelectorAll('.js_slider')).forEach(function (element, index) {
        lory(element, {
          enableMouseEvents: true
        });
      });
    }

  });

})(this.App);
