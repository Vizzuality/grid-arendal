(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.MediaFilters = Backbone.View.extend({

    initialize: function(settings) {
      this.options = settings && settings.options ? settings.options : {};

      this._loadFilters();
    },

    _loadFilters: function() {
      _.each(this.options.filters, function(filter) {
        switch (filter.type) {
          case "select":
            this._loadSelect(filter);
            break;
        }
      }.bind(this));
    },

    _loadSelect: function(filter) {
      new App.Helper.SelectHandler({
        el: filter.triggerClass,
        options: {
          filter: filter,
          callback: this._filterMedia
        }
      });
    },

    _filterMedia: function() {
      console.log("_filterMedia!!");
    }

  });

})(this.App);
