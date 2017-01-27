(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.IndexPagination = Backbone.View.extend({

    el: '.l-items-index .items-list',

    options: {
      loaderClass: "js-scroll-pagination-loader"
    },

    initialize: function(settings) {
      var opts = settings && settings.options ? settings.options : {};
      this.options = _.extend({}, this.options, opts);
      this.callback = settings.callback;

      this._initVariables();
      this._loadOnScrollEvent();
    },

    _initVariables: function() {
      this.page = this._getCurrentPage();
      this.doingCallback = false;
      this.blockPagination = false;
    },

    _updatePage: function(value) {
      this.page = value;
    },

    _loadOnScrollEvent: function() {
      this.$el.on('scroll', function() {
        if (this.$el.scrollTop() >= (this.$el[0].scrollHeight - this.$el.height())) {
          this._onScrollLoadPage();
        }
      }.bind(this));
    },

    _onScrollLoadPage: function() {
      if(
        !this.blockPagination &&
        !this.doingCallback
      ) {
        this.toggleDoingCallback();
        this._updatePage(this.page + 1);
        this.callback();
      }
    },

    _getCurrentPage: function() {
      var params = App.Helper.Utils.getGetParams();
      if(typeof params['page'] !== "undefined") {
        return parseInt(params['page']);
      }
      return 1;
    },

    toggleDoingCallback: function() {
      this.doingCallback = !this.doingCallback;
    },

    toggleBlockPagination: function() {
      this.blockPagination = !this.blockPagination;
    },

    showLoader: function() {
      this.$el.append(this._getLoaderHTML());
    },

    hideLoader: function() {
      $("." + this.options.loaderClass).remove();
    },

    _getLoaderHTML: function() {
      return '<div class="c-loader ' + this.options.loaderClass + '"><div class="sk-circle0 sk-child"></div><div class="sk-circle1 sk-child"></div><div class="sk-circle2 sk-child"></div><div class="sk-circle3 sk-child"></div><div class="sk-circle4 sk-child"></div><div class="sk-circle5 sk-child"></div><div class="sk-circle6 sk-child"></div><div class="sk-circle7 sk-child"></div><div class="sk-circle8 sk-child"></div><div class="sk-circle9 sk-child"></div><div class="sk-circle10 sk-child"></div><div class="sk-circle11 sk-child"></div></div>';
    }

  });

})(this.App);
