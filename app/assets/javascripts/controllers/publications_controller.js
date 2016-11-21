(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.Publications = App.Controller.Page.extend({

    index: function(params) {
      var masonryView = new App.View.Masonry({
        el: '#masonry-layout'
      });
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
            },
            {
              type: "years",
              triggerClass: ".js-years-filter"
            }
          ]
        }
      });
    },

    show: function(params) {
      console.log('publications#show');
      this.initSliders();
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
