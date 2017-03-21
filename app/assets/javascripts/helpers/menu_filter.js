
(function(App) {

  'use strict';

  App.Helper = App.Helper || {};

  App.Helper.MenuFilter = Backbone.View.extend({

    options: {
      selectedClass: "selected"
    },

    selectedValues: [],

    initialize: function(settings) {
      if (!this.el) {
        return;
      }
      var opts = settings && settings.options ? settings.options : {};
      this.options = _.extend({}, this.options, opts);

      this.selectedValues = [];

      this._cache();
      this._setEventValues();
    },

    _cache: function() {
      this.$values = this.$el.find("li");
      this.key = this.$el.data("filter-key");
    },

    _updateSelectedValues: function(drop, value) {
      if (drop) {
        this.selectedValues = [];
      } else {
        this.selectedValues = [value];
      }
    },

    _setEventValues: function() {
      this.$values.on('click', function(e) {
        this._setSelectValue(e);
      }.bind(this));
    },

    _setSelectValue: function(e) {
      var element = $(e.currentTarget);
      var value = element.data("value");
      var isSelected = element.hasClass(this.options.selectedClass);

      this.$values.removeClass(this.options.selectedClass);
      if(!isSelected) {
        element.addClass(this.options.selectedClass);
      }

      this._updateSelectedValues(isSelected, value);
      this._setHaveValue();
      this._runCallback(
        !isSelected ? value : null
      );
    },

    _setHaveValue: function () {
      this.$el.addClass(this.options.haveValueClass);
    },

    _runCallback: function(value) {
      if (typeof this.options.callback == "function") {
        this.options.callback({
          key: this.key,
          value: value
        });
      }
    },

  });

})(this.App);
