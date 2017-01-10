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

      this._cache();
      this._initVariables();
      this._checkCurrentPage();
      this._loadOnScrollEvent();
      this.hideFooter();
    },

    _cache: function() {
      this.$footer = this.$el.find(this.options.footerClass);
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

      window.history.replaceState('', '', query.replace('&', '?'));
    },

    _loadOnScrollEvent: function() {
      $(window).on('scroll', _.throttle(
        this._onScrollLoadPage, 300).bind(this)
      );
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

    showFooter: function() {
      this.$footer.show();
    },

    hideFooter: function() {
      this.$footer.hide();
    },

    showLoader: function() {
      $(this.options.contentClass).append(this.getLoaderHTML());
    },

    hideLoader: function() {
      $("." + this.options.loaderClass).remove();
    },

    getLoaderHTML: function() {
      return '<div class="row ' + this.options.loaderClass + '"><div class="small-12 column"><div class="c-loader"><div class="sk-circle0 sk-child"></div><div class="sk-circle1 sk-child"></div><div class="sk-circle2 sk-child"></div><div class="sk-circle3 sk-child"></div><div class="sk-circle4 sk-child"></div><div class="sk-circle5 sk-child"></div><div class="sk-circle6 sk-child"></div><div class="sk-circle7 sk-child"></div><div class="sk-circle8 sk-child"></div><div class="sk-circle9 sk-child"></div><div class="sk-circle10 sk-child"></div><div class="sk-circle11 sk-child"></div></div></div></div>';
    }

  });

})(this.App);
