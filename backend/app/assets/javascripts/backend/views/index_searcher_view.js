(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.IndexSearcher = Backbone.View.extend({

    el: '.l-items-index',

    events: {
      'click .js-index-searcher-button': '_onClickShowInput'
    },

    options: {
      loaderClass: "js-scroll-pagination-loader",
      inputBoxClass: ".js-index-searcher",
      inputClass: ".js-index-searcher-input",
      itemsListClass: ".items-list"
    },

    initialize: function(settings) {
      var opts = settings && settings.options ? settings.options : {};
      this.options = _.extend({}, this.options, opts);
      this.callback = settings.callback;
      this.indexPaginationView = settings.indexPaginationView;

      this._cache();
      this._initVariables();
      this._loadInputEvent();
    },

    _cache: function () {
      this.$inputBox = $(this.$el.find(this.options.inputBoxClass));
      this.$input = $(this.$el.find(this.options.inputClass));
      this.$itemsList = $(this.$el.find(this.options.itemsListClass));
    },

    _initVariables: function() {
      this.doingCallback = false;
      this.search = null;
    },

    _updateSearch: function (search) {
      this.search = search;
    },

    _loadInputEvent: function() {
      this.$input.on('keydown', function(e) {
        var inputValue = this.$input.val();
        if(e.keyCode === 13 && inputValue != '') {
          this._onClickLoadSearch(inputValue);
          this.indexPaginationView.blockPagination();
        } else if(e.keyCode === 27) {
          this._hideInput();
          this.indexPaginationView.unblockPagination();
        }
      }.bind(this));
    },

    _onClickLoadSearch: function(search) {
      if(!this.doingCallback) {
        this.toggleDoingCallback();
        this._updateSearch(search);
        this.callback();
      }
    },

    _onClickShowInput: function () {
      this.$inputBox.show();
      this.$input.focus();
    },

    _hideInput: function () {
      this.$inputBox.hide();
      this._onClickLoadSearch('');
    },

    toggleDoingCallback: function() {
      this.doingCallback = !this.doingCallback;
    },

    showLoader: function() {
      this.$itemsList.html(this._getLoaderHTML());
    },

    hideLoader: function() {
      $("." + this.options.loaderClass).remove();
    },

    _getLoaderHTML: function() {
      return '<div class="c-loader ' + this.options.loaderClass + '"><div class="sk-circle0 sk-child"></div><div class="sk-circle1 sk-child"></div><div class="sk-circle2 sk-child"></div><div class="sk-circle3 sk-child"></div><div class="sk-circle4 sk-child"></div><div class="sk-circle5 sk-child"></div><div class="sk-circle6 sk-child"></div><div class="sk-circle7 sk-child"></div><div class="sk-circle8 sk-child"></div><div class="sk-circle9 sk-child"></div><div class="sk-circle10 sk-child"></div><div class="sk-circle11 sk-child"></div></div>';
    }

  });

})(this.App);
