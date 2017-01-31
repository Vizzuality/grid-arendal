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
      this.indexSearcherView = new App.View.IndexSearcher({
        callback: this._indexSearcher.bind(this),
        indexPaginationView: this.indexPaginationView
      });
    },

    show: function(params) {
      new App.View.Form({});
      new App.View.IndexItems({});
      this.indexPaginationView = new App.View.IndexPagination({
        callback: this._indexPaginate.bind(this, params)
      });
      this.indexSearcherView = new App.View.IndexSearcher({
        callback: this._indexSearcher.bind(this, params),
        indexPaginationView: this.indexPaginationView
      });
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

    _indexSearcher: function(params) {
      params = _.extend({}, params, { search: this.indexSearcherView.search });
      var path = window.location.pathname.split("/");

      $.ajax({
        method: "GET",
        cache: true,
        url: '/' + path[1] + '/' + path[2] + '/search',
        data: params,
        beforeSend: function() {
          this.indexSearcherView.showLoader();
        }.bind(this),
        complete: function() {
          this.indexSearcherView.toggleDoingCallback();
          this.indexSearcherView.hideLoader();
        }.bind(this)
      });
    },

  });

})(this.App);
