(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.IndexSearcher = Backbone.View.extend({

    el: '.l-items-index',

    events: {
      'click .js-index-searcher-button': '_onClickShowInput',
      'click .js-index-searcher-close': '_hideInput'
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
      this.search = null;

      this._cache();
      this._loadInputEvent();
    },

    _cache: function () {
      this.$inputBox = $(this.$el.find(this.options.inputBoxClass));
      this.$input = $(this.$el.find(this.options.inputClass));
      this.$itemsList = $(this.$el.find(this.options.itemsListClass));
    },

    _setHash: function () {
      var url = this.search !== '' && this.search !== null ? '?search=' + this.search: '?';
      Turbolinks.visit(url);
    },

    _updateSearch: function (search) {
      this.search = search;
    },

    _loadInputEvent: function() {
      this.$input.on('keydown', function(e) {
        var inputValue = this.$input.val();
        if(e.keyCode === 13 && inputValue != '') {
          this._onClickLoadSearch(inputValue);
        } else if(e.keyCode === 27) {
          this._hideInput();
        }
      }.bind(this));
    },

    _onClickLoadSearch: function(search) {
      this._updateSearch(search);
      this._setHash();
    },

    _onClickShowInput: function () {
      this.$inputBox.show();
      this.$input.focus();
    },

    _hideInput: function () {
      this.$inputBox.hide();
      this._onClickLoadSearch('');
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
