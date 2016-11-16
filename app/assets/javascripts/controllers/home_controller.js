(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.Home = App.Controller.Page.extend({

    index: function() {
      this.initSliders();
      if (window.matchMedia("(max-width: 768px)").matches) {
        $('.image-slider').addClass('slide-' + (parseInt(Math.floor(Math.random() * 4)) + 1) );
      }
      // var homeSliderView = new App.View.HomeSlider();
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
