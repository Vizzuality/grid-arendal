(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.Activities = App.Controller.Page.extend({

    index: function(params) {
      new App.View.Masonry({
        el: '#masonry-layout'
      });
      this.filtersView = new App.View.MediaFilters({
        callback: this._filter.bind(this)
      });
    },

    show: function(params) {
      new App.View.ActivitiesAnchors({});
      this.initSliders();
    },

    _filter: function() {
      console.log(this.filtersView.getStringifyFiltersValue());
      console.log("_filter!!");
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
