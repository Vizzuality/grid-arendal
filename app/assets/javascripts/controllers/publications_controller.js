(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.Publications = App.Controller.Page.extend({

    index: function(params) {
      console.log('publications#index');
    },

    show: function(params) {
      console.log('publications#show');
      this.initSliders();
    },

    initSliders: function() {

      Array.prototype.slice.call(document.querySelectorAll('.js_slider')).forEach(function (element, index) {
        lory(element, {
          infinite: 3,
          slidesToScroll: 1,
          enableMouseEvents: true
        });
      });
    }

  });

})(this.App);
