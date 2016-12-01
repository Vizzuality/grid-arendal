(function(App) {

  'use strict';

  App.Helper = App.Helper || {};

  App.Helper.YearsFilter = Backbone.View.extend({

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

      this._cache();
      this._onClickYears();
    },

    _cache: function() {
      this.$years = this.$el.find("li");
    },

    _updateSelectedYears: function(drop, value) {
      if (drop) {
        this.selectedValues = _.without(this.selectedValues, value);
      } else {
        this.selectedValues.push(value);
      }
    },

    _onClickYears: function() {
      this.$years.on('click', function(e) {
        this._setSelectValue(e);
      }.bind(this));
    },

    _setSelectValue: function(e) {
      var element = $(e.currentTarget);
      var isSelected = element.hasClass(this.options.selectedClass);
      element.toggleClass(this.options.selectedClass);

      this._updateSelectedYears(isSelected, element.data("value"));
      this._setHaveValue();
      this._runCallback();
    },

    _setHaveValue: function () {
      this.$el.addClass(this.options.haveValueClass);
    },

    _runCallback: function() {
      if (typeof this.options.callback == "function") {
        this.options.callback();
      }
    },

  });

})(this.App);
