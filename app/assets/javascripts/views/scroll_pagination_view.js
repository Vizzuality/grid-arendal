(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.ScrollPagination = Backbone.View.extend({

    el: 'body',

    options: {
      footerClass: ".l-footer",
      loaderClass: "js-scroll-pagination-loader"
    },

    initialize: function(settings) {
      var opts = settings && settings.options ? settings.options : {};
      this.options = _.extend({}, this.options, opts);
      this.callback = settings.callback;

      this._initVariables();
      this._checkCurrentPage();
      this._loadOnScrollEvent();
    },

    _initVariables: function() {
      this.page = 1;
      this.doingCallback = false;
      this.blockPagination = false;
    },

    _checkCurrentPage: function() {
      var params = App.Helper.Utils.getGetParams();
      if(typeof params['page'] !== "undefined") {
        this.page = parseInt(params['page']);
      }
    },

    _updatePage: function(value) {
      this.page = value;
    },

    _setHash: function () {
      var params = App.Helper.Utils.getGetParams();
      params['page'] = this.page;

      var query = '';
      _.each(params, function (value, index) {
        query += '&' + index + '=' + value;
      });
    },

    _loadOnScrollEvent: function() {
      var footerHeight = $(this.options.footerClass).height();

      $(window).on('scroll', function() {
        if ($(window).scrollTop() > $(document).height() - $(window).height() - footerHeight ) {
          this._onScrollLoadPage();
        }
      }.bind(this));
    },

    _onScrollLoadPage: function() {
      var pageScrollLimit = $(document).height() - ($(window).height() * 2);

      if(
        !this.blockPagination &&
        !this.doingCallback &&
        $(window).scrollTop() > pageScrollLimit
      ) {
        this.toggleDoingCallback();
        this._updatePage(this.page + 1);
        this.callback();
      }
    },

    toggleDoingCallback: function() {
      this.doingCallback = !this.doingCallback;
    },

    toggleBlockPagination: function() {
      this.blockPagination = !this.blockPagination;
    },

    showLoader: function() {
      $(this.options.contentClass).append(this.getLoaderHTML());
    },

    hideLoader: function() {
      $("." + this.options.loaderClass).remove();
    },

    getLoaderHTML: function() {
      return '<div class="row ' + this.options.loaderClass + '"><div class="small-12 column"><div class="c-loader"></div></div></div>';
    }

  });

})(this.App);

