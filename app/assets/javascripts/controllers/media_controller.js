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
      this.scrollPaginationView = new App.View.ScrollPagination({
        callback: this._paginate.bind(this)
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

    _paginate: function() {
      var params = _.extend({}, App.Helper.Utils.getGetParams(), { page: this.scrollPaginationView.page });
      $.ajax({
        method: "GET",
        cache: true,
        url: '/media-library/paginate',
        data: params,
        complete: function(response) {
          this.scrollPaginationView.toggleDoingCallback();

          if(response.status === 204) {
            this.scrollPaginationView.toggleBlockPagination();
            this.scrollPaginationView.toggleFooter();
          } else {
            this.scrollPaginationView._setHash();
          }

        }.bind(this)
      });
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
