(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.Users = App.Controller.Page.extend({

    show: function() {
      if(this.isScreen_s) {
        this.initSliders();
      } else {
        _.each($('.masonry-layout'), function(element) {
          new App.View.Masonry({
            el: element
          });
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
