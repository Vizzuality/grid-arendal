(function(App) {

  'use strict';

  App.Helper = App.Helper || {};

  App.Helper.SelectHandler = Backbone.View.extend({

    options: {
      closerClass: "c-filters-closer",
      showDropdownClass: "-show-dropdown",
      haveValueClass: "-have-value",
      selectedClass: "selected",
      screenMWidth: 768
    },

    selectedValues: [],

    initialize: function(settings) {
      if (!this.el) {
        return;
      }
      var opts = settings && settings.options ? settings.options : {};
      this.options = _.extend({}, this.options, opts);

      this._cache();
      this._onClickOpenDropdown();
      this._onClickOptions();
      this._onChangeSelectValue();
      this._setSelectFromUrl();
    },

    _setSelectFromUrl: function() {
      var activeFilters = this._getFiltersFromUrl();
      if ( activeFilters === false ) {
        return false
      }
      _.each(activeFilters, function(value, filter) {
        if ( filter !== 'tags' ) {
          this._updateSelectedValue(value);
          this.$select
            .val(value)
            .change();
        }
      }.bind(this));
    },

    _getFiltersFromUrl: function() {
      var vars = {}, hash;
      var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
      var route = 'http://' + window.location.host + window.location.pathname;
      if ( hashes[0] === route ) {
        return false
      }
      for ( var i = 0; i < hashes.length; i++ ) {
          hash = hashes[i].split('=');
          vars[hash[0]] = hash[1];
      }
      return vars;
    },

    _cache: function() {
      this.$select = this.$el.find("select");
      this.$speaker = this.$el.find(".speaker");
      this.$speakerText = this.$el.find(".speaker .text");
      this.$dropdown = this.$el.find(".dropdown");
      this.key = this.$el.data("filter-key");
    },

    _setSpeaker: function(value) {
      this.$speakerText.html(value);
    },

    _setSelectValue: function(element) {
      var value = $(element.currentTarget).data("value");
      this._updateSelectedValue(value);
      this.$select
        .val(value)
        .change();
    },

    _setHaveValue: function () {
      this.$el.addClass(this.options.haveValueClass);
    },

    _updateSelectedValue: function(value) {
      this.selectedValues = [value];
    },

    _openDropdown: function() {
      this.$el.addClass(this.options.showDropdownClass);
      this._showCloser();
    },

    _closeDropdown: function() {
      this.$el.removeClass(this.options.showDropdownClass);
    },

    _showCloser: function() {
      $("<div></div>", {
        "class": this.options.closerClass,
        on: {
          click: function() {
            this._closeProcess();
          }.bind(this)
        }
      }).appendTo("body");
    },

    _destroyCloser: function() {
      $("." + this.options.closerClass).remove();
    },

    _closeProcess: function() {
      this._closeDropdown();
      this._destroyCloser();
    },

    _onClickOpenDropdown: function() {
      this.$speaker.on('click', function() {
        this._openDropdown();
      }.bind(this));
    },

    _onClickOptions: function() {
      this.$el.find(".dropdown li").on('click', function(e) {
        this._setSelectValue(e);
      }.bind(this));
    },

    _onChangeSelectValue: function() {
      this.$select.change(function(e) {
        this._setHaveValue();
        this._setSpeaker(this.$el.find("option:selected").text());
        this._closeProcess();
        this._runCallback();
      }.bind(this));
    },

    _runCallback: function() {
      if (typeof this.options.callback == "function") {
        this.options.callback();
      }
    },

  });

})(this.App);
