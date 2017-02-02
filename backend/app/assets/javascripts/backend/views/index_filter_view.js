(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.IndexFilter = Backbone.View.extend({

    el: '.l-items-index',

    events: {
      'click .js-index-filter': '_onClickDoFilter'
    },

    selectedFilters: [],

    _onClickDoFilter: function(e) {
      var key = $(e.currentTarget).data('key');
      this._updateSelectedFilters(key);
      this._setHash();
    },

    _updateSelectedFilters: function(key) {
      var index = this.selectedFilters.indexOf(key);
      if(index === -1) {
        this.selectedFilters.push(key);
      } else {
        this.selectedFilters.splice(index, 1);
      }
    },

    _setHash: function () {
      var url = '?';

      _.each(this.selectedFilters, function(item, index) {
        if(index != 0) {
          url += '&';
        }
        url += item + '=true';
      });
      Turbolinks.visit(url);
    },

  });

})(this.App);
