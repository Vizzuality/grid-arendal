(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.News = App.Controller.Page.extend({

    index: function(params) {
      if($('.masonry-layout').find('.masonry-column').length === 0) {
        new App.View.Masonry({
          el: '.masonry-layout'
        });
      }
      this.scrollPaginationView = new App.View.ScrollPagination({
        callback: this._paginate.bind(this)
      });
    },

    _paginate: function() {
      var params = _.extend({}, App.Helper.Utils.getGetParams(), { page: this.scrollPaginationView.page });
      $.ajax({
        method: "GET",
        cache: true,
        url: '/news/paginate',
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

  });

})(this.App);
