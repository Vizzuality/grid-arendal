(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.About = App.Controller.Page.extend({

    index: function(params) {
      new App.View.AboutAnchors({});
      if(this.isScreen_s) {
        this.initSliders();
      } else {
        new App.View.Masonry({
          el: '.masonry-layout'
        });
      }
    },

    initSliders: function() {
      Array.prototype.slice.call(document.querySelectorAll('.js_slider')).forEach(function (element, index) {
        lory(element, {
          rewind: true,
          enableMouseEvents: true
        });
      });
    }

  });

})(this.App);
