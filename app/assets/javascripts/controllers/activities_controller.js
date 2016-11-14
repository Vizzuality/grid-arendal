(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.Activities = App.Controller.Page.extend({

    index: function(params) {
      var masonryView = new App.View.Masonry({
        el: '#masonry-layout'
      });
    },

    show: function(params) {
      var activitiesAnchorsView = new App.View.ActivitiesAnchors({});
      //this.initSliders();
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
