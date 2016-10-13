(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.Home = App.Controller.Page.extend({

    index: function() {
      this.initSliders();
    },

    initSliders: function() {

      var ease = document.querySelector('.js_slider');

      // http://easings.net/

      lory(ease, {
        infinite: 3,
        slidesToScroll: 1,
        slideSpeed: 1000,
        enableMouseEvents: true,
        ease: 'cubic-bezier(0.455, 0.03, 0.515, 0.955)'
      });
    }

  });


})(this.App);
