(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.BackOfficeHome = App.Controller.Page.extend({

    index: function() {
      new App.View.Phrases({});
      new App.View.IndexItems({});
      new App.View.Form({});
      this.indexPaginationView = new App.View.IndexPagination({
        callback: this._indexPaginate.bind(this)
      });
      new App.View.IndexSearcher();
      new App.View.IndexFilter();
    },

    show: function(params) {
      new App.View.Form({});
      new App.View.IndexItems({});
      this.indexPaginationView = new App.View.IndexPagination({
        callback: this._indexPaginate.bind(this, params)
      });
      new App.View.IndexSearcher();
      new App.View.IndexFilter();
      this.scrollElementIntoView(params);
    },

    scrollElementIntoView: function(params) {
      $('#item_'+params['id'])[0].scrollIntoView( true );
    },

    _indexPaginate: function(params) {
      params = _.extend({}, params, { page: this.indexPaginationView.page });
      var path = window.location.pathname.split("/");

      $.ajax({
        method: "GET",
        cache: true,
        url: '/' + path[1] + '/' + path[2] + '/paginate',
        data: params,
        beforeSend: function() {
          this.indexPaginationView.showLoader();
        }.bind(this),
        complete: function(response) {
          this.indexPaginationView.toggleDoingCallback();
          this.indexPaginationView.hideLoader();

          if(response.status === 204 || response.status === 500) {
            this.indexPaginationView.blockPagination();
          }
        }.bind(this)
      });
    },

  });

})(this.App);
