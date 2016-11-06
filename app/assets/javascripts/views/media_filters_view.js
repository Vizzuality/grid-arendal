(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.MediaFilters = Backbone.View.extend({

    el: '.c-filters',

    events: {
      'click .js-filters-maximizer' : '_onClickToggleFilters'
    },

    options: {
      opened: false,
      showFiltersClass: "-show-filters",
      openFiltersAnimateSpeed: 0.5
    },

    initialize: function(settings) {
      var opts = settings && settings.options ? settings.options : {};
      this.options = _.extend({}, this.options, opts);

      this._loadFilters();
      this.cache();
    },

    cache: function() {
      this.$container = this.$el.find('.container');
    },

    _loadFilters: function() {
      _.each(this.options.filters, function(filter) {
        switch (filter.type) {
          case "select":
            this._loadSelect(filter);
            break;
          case "tag":
            this._loadTag(filter);
            break;
        }
      }.bind(this));
    },

    _loadSelect: function(filter) {
      new App.Helper.SelectHandler(this._getHelperFilterObject(filter));
    },

    _loadTag: function(filter) {
      new App.Helper.TagSelectHandler(this._getHelperFilterObject(filter));
    },

    _getHelperFilterObject: function(filter) {
      return {
        el: filter.triggerClass,
        options: {
          filter: filter,
          callback: this._filterMedia
        }
      };
    },

    _filterMedia: function() {
      console.log("_filterMedia!!");
    },

    _onClickToggleFilters: function() {
      if (!this.opened) {
        if (typeof this.filtersHeight == "undefined") {
          this.filtersHeight = this._getFiltersHeight();
        }
        this.$container.css("height", this.filtersHeight);
      } else {
        this.$container.attr("style", "");
      }

      this.opened = !this.opened;
      this.$el.toggleClass(this.options.showFiltersClass);
    },

    _getFiltersHeight: function() {
      var elem = this.$container.clone().css("height", "auto").appendTo(this.$el);
      var height = elem.css("height");
      elem.remove();

      return height;
    }

  });

})(this.App);
