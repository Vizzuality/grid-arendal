(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.Home = App.Controller.Page.extend({

    index: function() {
      this.initSliders();
      if (window.matchMedia("(max-width: 768px)").matches) {
        $('body').addClass('slide-' + (parseInt(Math.floor(Math.random() * 6)) + 1) );
      }
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
