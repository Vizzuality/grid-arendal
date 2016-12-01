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
      openFiltersAnimateSpeed: 0.5,
      filterTriggerClass: ".js-filter"
    },

    initialize: function(settings) {
      var opts = settings && settings.options ? settings.options : {};
      this.options = _.extend({}, this.options, opts);
      this.callback = settings.callback;

      this._loadFilters();
      this._cache();
    },

    _cache: function() {
      this.$container = this.$el.find('.container');
    },

    _loadFilters: function() {
      this.filters = [];
      _.each(this.$el.find(this.options.filterTriggerClass), function(item) {
        var filter = $(item);
        switch (filter.data("filter-type")) {
          case "select":
            this._loadSelect(this._getHelperFilterObject(filter));
            break;
          case "tags":
            this._loadTag(this._getHelperFilterObject(filter));
            break;
          case "years":
            this._loadYears(this._getHelperFilterObject(filter));
            break;
        }
      }.bind(this));
    },

    _loadSelect: function(helperFilter) {
      this.filters.push(new App.Helper.SelectHandler(helperFilter));
    },

    _loadTag: function(helperFilter) {
      this.filters.push(new App.Helper.TagSelectHandler(helperFilter));
    },

    _loadYears: function(helperFilter) {
      this.filters.push(new App.Helper.YearsFilter(helperFilter));
    },

    _getHelperFilterObject: function(filter) {
      return {
        el: filter,
        options: {
          callback: this._filterMedia.bind(this)
        }
      };
    },

    _filterMedia: function() {
      this.callback();
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
