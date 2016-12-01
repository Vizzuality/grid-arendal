(function(App) {

  'use strict';

  App.Helper = App.Helper || {};

  App.Helper.FormMediaContentSearch = Backbone.View.extend({

    events: {
      'keyup' : '_search',
    },

    initialize: function() {
      if (!this.el) {
        return;
      }
    },

    _search: function (e) {
      debugger;
      $.get('/manage/media_contents/search', {query: $(this).val()});
    },

  });

})(this.App);
