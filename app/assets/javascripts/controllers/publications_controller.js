(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.Publications = App.Controller.Page.extend({

    index: function(params) {
      new App.View.Masonry({
        el: '#masonry-layout'
      });
      this.filtersView = new App.View.MediaFilters({
        callback: this._filter.bind(this)
      });
    },

    show: function(params) {
      console.log('publications#show');
      this.initSliders();
    },

    _filter: function() {
      jQuery.ajaxSetup({cache: true});
      $.getScript($(location).attr('href'));
      return false;
    },

    initSliders: function() {

      Array.prototype.slice.call(document.querySelectorAll('.js_slider')).forEach(function (element, index) {
        lory(element, {
          infinite: 3,
          slidesToScroll: 1,
          enableMouseEvents: true,
          offsetLeft: 0
        });
      });
    }

  });

})(this.App);
