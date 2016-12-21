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
      if(this.isScreen_s) {
        this.initSliders();
      } else {
        if($('.masonry-layout').find('.masonry-column').length === 0) {
          _.each($('.masonry-layout'), function(element) {
            new App.View.Masonry({
              el: element
            });
          });
        }
      }
    },

    initSliders: function() {
      _.each($('.js_slider'), function(element) {
        lory(element, {
          enableMouseEvents: true
        });
      }.bind(this));
    }

  });

})(this.App);
