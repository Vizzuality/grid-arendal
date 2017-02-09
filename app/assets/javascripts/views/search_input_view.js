(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.SearchInput = Backbone.View.extend({

    el: '.js-search-input',

    initialize: function() {
      this._focusInput();
    },

    _focusInput: function () {
      this.$el
        .focus()
        .val(this.$el.val());
    }

  });

})(this.App);
