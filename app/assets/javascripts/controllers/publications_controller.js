(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.Publications = App.Controller.Page.extend({

    index: function(params) {
      if($('.masonry-layout').find('.masonry-column').length === 0) {
        new App.View.Masonry({
          el: '.masonry-layout'
        });
      }
      new App.View.MediaFilters({
        callback: this._filter.bind(this)
      });
    },

    show: function() {
      new App.View.DescriptionView({
        el: '.content-wrapper'
      });
      this.initSliders();
      if(!this.isScreen_s) {
        _.each($('.masonry-layout'), function(element) {
          new App.View.Masonry({
            el: element
          });
        });
      }
    },

    _filter: function() {
      jQuery.ajaxSetup({cache: true});
      $.getScript($(location).attr('href'));
      return false;
    },

    initSliders: function() {
      _.each($('.js_slider'), function(element) {
        lory(element, {
          rewind: true,
          enableMouseEvents: true
        });
      });
    }

  });

})(this.App);
