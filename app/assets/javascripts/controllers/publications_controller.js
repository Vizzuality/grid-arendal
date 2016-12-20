(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.Publications = App.Controller.Page.extend({

    index: function(params) {
      new App.View.Masonry({
        el: '.masonry-layout'
      });
      this.filtersView = new App.View.MediaFilters({
        callback: this._filter.bind(this)
      });
    },

    show: function() {
      new App.View.DescriptionView({
        el: '.content-wrapper'
      });
      if(this.isScreen_s) {
        this.initSliders();
      } else {
        new App.View.Masonry({
          el: '.masonry-layout'
        });
      }
    },

    _filter: function() {
      jQuery.ajaxSetup({cache: true});
      $.getScript($(location).attr('href'));
      return false;
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
