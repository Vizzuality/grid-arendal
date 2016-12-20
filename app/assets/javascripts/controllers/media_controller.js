(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.Media = App.Controller.Page.extend({

    index: function(params) {
      if($('.masonry-layout').find('.masonry-column').length === 0) {
        var masonryView = new App.View.Masonry({
          el: '.masonry-layout'
        });
      }
      var filtersView = new App.View.MediaFilters({
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
      var masonryView = new App.View.Masonry({
        el: '.masonry-layout'
      });
    },

  });

})(this.App);
