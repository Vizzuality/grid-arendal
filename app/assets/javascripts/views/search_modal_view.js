(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.SearchModal = Backbone.View.extend({

    el: 'body',

    events: {
      'click .js-search-toggle': '_onClickSearchButton',
      'click .js-search-modal-background': '_closeSearcher',
    },

    options: {
      hiddenClass: '-hidden'
    },

    initialize: function() {
      this._cache();
    },

    _cache: function () {
      this.isOpen = false;
      this.$searcherModal = $('.js-search-modal');
      this.$input = this.$searcherModal.find('.c-search-input');
      this.$menu = $('.c-menu');
      this.$landingSearcher = $('.js-search-input');
    },

    _onClickSearchButton: function() {
      if(this.$landingSearcher.length > 0) {
        this.$landingSearcher
          .focus()
          .val(this.$landingSearcher.val());
      } else {
        this._toggleSearcher();
      }
    },

    _toggleSearcher: function () {
      if(this.isOpen){
        this._closeSearcher();
      } else {
        this._openSearcher();
      }
    },

    _openSearcher: function () {
      this.$searcherModal.removeClass(this.options.hiddenClass);
      this.$menu.css('z-index', 120);
      this._focusInput();
      this.isOpen = true;
    },

    _closeSearcher: function () {
      $('.js-search-modal').addClass(this.options.hiddenClass);
      this.$menu.attr('style', null);
      this.isOpen = false;
    },

    _focusInput: function () {
      this.$input
        .focus()
        .val(this.$input.val());
    }
  });

})(this.App);
