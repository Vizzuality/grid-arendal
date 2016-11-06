(function(App) {

  'use strict';

  App.Helper = App.Helper || {};

  App.Helper.TagSelectHandler = App.Helper.SelectHandler.extend({

    events: {
      'click .js-tags-select-closer' : '_closeProcess'
    },

    selectedTags: [],

    _setSelectValue: function(e) {
      var element = $(e.currentTarget);
      var isSelected = element.hasClass("selected");
      element.toggleClass("selected");

      this._updateSelectedTags(isSelected, element.data("value"));
      this._setSpeaker();
      this.$el.addClass(this.options.haveValueClass);
    },

    _updateSelectedTags: function(drop, value) {
      if (drop) {
        this.selectedTags = _.without(this.selectedTags, value);
      } else {
        this.selectedTags.push(value);
      }
    },

    _setSpeaker: function() {
      this.$el.find(".speaker .text").html(this.selectedTags.join(", "));
    },

    _openDropdown: function() {
      if ($(document).width() <= this.options.screenMWidth) {
        console.log($(document).width());
      } else {
        this.$el.addClass(this.options.showDropdownClass);
      }
    },

    _closeDropdown: function() {
      this.$el.removeClass(this.options.showDropdownClass);
    },

    _closeProcess: function() {
      this._closeDropdown();
      this._destroyCloser();
      this._runCallback();
    },

  });

})(this.App);
