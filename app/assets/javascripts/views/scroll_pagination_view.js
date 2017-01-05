(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.ScrollPagination = Backbone.View.extend({

    el: 'body',

    options: {
      footerClass: ".l-footer",
    },

    initialize: function(settings) {
      this.callback = settings.callback;

      this._cache();
      this._initVariables();
      this._checkCurrentPage();
      this._loadOnScrollEvent();
      this.toggleFooter();
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
        query = '&' + index + '=' + value;
      });

      window.history.pushState('', '', query.replace('&', '?'));
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

    toggleFooter: function() {
      this.$footer.toggle();
    },

  });

})(this.App);
