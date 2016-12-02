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
      this._setFiltersFromUrl();
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
      this._setHash();
      this.callback();
    },

    _setHash: function () {
      var url = '?' + this.getFilterValues();
      window.history.pushState('', '', url);
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
    },

    _getFiltersFromUrl: function() {
      var vars = {}, hash;
      var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
      for ( var i = 0; i < hashes.length; i++ ) {
          hash = hashes[i].split('=');
          vars[hash[0]] = hash[1];
      }
      return vars;
    },

    _setFiltersFromUrl: function() {
      var activeFilters = this._getFiltersFromUrl();
      console.log(activeFilters);
      var i = 0;
      _.each(activeFilters, function(value, filter) {
        this.filters[i].selectedValues = value;
        // set active class
        console.log(filter);
        console.log(value);

        $('.filter[data-filter-key="' + filter + '"]').addClass('-have-value');
        var activeFilterItem = $('.filter[data-filter-key="' + filter + '"]').find('.-filter[data-value="' + value + '"]');
        $('#' + filter).text(activeFilterItem.text());
        i++;
      }.bind(this));
    },

    getFilterValues: function() {
      var queryStr = '';
      var filterNum = this.filters.length;
      _.each(this.filters, function (filter, index) {
        if ( filter.selectedValues.length > 0 ) {
          if ( index > 0 ) {
            queryStr += '&';
          }
          queryStr += filter.key + '=';
          _.each(filter.selectedValues, function (value, index) {
            queryStr += value;
            if ( index < filter.selectedValues.length - 1 ) {
              queryStr += ',';
            }
          });
        }
      });
      return queryStr;
    },

  });

})(this.App);
