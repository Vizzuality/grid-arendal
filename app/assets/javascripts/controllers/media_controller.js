(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.Media = App.Controller.Page.extend({

    index: function(params) {
      if($('.masonry-layout').find('.masonry-column').length === 0) {
        new App.View.Masonry({
          el: '.masonry-layout'
        });
      }
      new App.View.MediaFilters({
        options: {
          filters: [
            {
              type: "select",
              triggerClass: ".js-dropdown-order-by"
            },
            {
              type: "select",
              triggerClass: ".js-dropdown-filter-by-type"
            },
            {
              type: "tag",
              triggerClass: ".js-dropdown-filter-by-tags"
            }
          ]
        }
      });
    },

    show: function(params) {
      if($('.masonry-layout').find('.masonry-column').length === 0) {
        new App.View.Masonry({
          el: '.masonry-layout'
        });
      }
      this.initSliders();
    },

    initSliders: function() {
      _.each($('.js_slider'), function(element) {
        lory(element, {
          rewind: true,
          enableMouseEvents: true
        });
      }.bind(this));
    }

  });

})(this.App);
