(function(App) {

  'use strict';

  App.Helper = App.Helper || {};

  App.Helper.TagSelectHandler = App.Helper.SelectHandler.extend({

    events: {
      'click .js-tags-select-closer' : '_closeProcess'
    },

    selectedTagsNames: [],

    _setSelectValue: function(e) {
      var element = $(e.currentTarget);
      var isSelected = element.hasClass(this.options.selectedClass);
      element.toggleClass(this.options.selectedClass);

      this._updateSelectedTags(isSelected, element);
      this._setSpeaker();
      this._setHaveValue();
    },

    _updateSelectedTags: function(drop, element) {
      var value = element.data("value");
      var name = element.data("name");
      if (drop) {
        this.selectedValues = _.without(this.selectedValues, value);
        this.selectedTagsNames = _.without(this.selectedTagsNames, name);
      } else {
        this.selectedValues.push(value);
        this.selectedTagsNames.push(name);
      }
    },

    _setSpeaker: function() {
      this.$speakerText.html(
        this.selectedTagsNames.length > 0
          ? this.selectedTagsNames.join(", ")
          : this.$speakerText.data("placeholder")
      );
    },

    _setHaveValue: function () {
      this.selectedValues.length > 0
        ? this.$el.addClass(this.options.haveValueClass)
        : this.$el.removeClass(this.options.haveValueClass)
    },

    _openDropdown: function() {
      if (this._needToOpenAsModal()) {
        this._openDropdownAsModal();
      } else {
        this.$el.addClass(this.options.showDropdownClass);
        this._showCloser();
      }
    },

    _openDropdownAsModal: function() {
      if (typeof this.dropdownModalView == "undefined") {
        this._buildDropdownModal();
      }

      this.dropdownModalView.show();
    },

    _closeDropdown: function() {
      if (this._needToOpenAsModal()) {
        this.dropdownModalView.hide();
      } else {
        this.$el.removeClass(this.options.showDropdownClass);
      }
    },

    _closeProcess: function() {
      this._closeDropdown();
      this._destroyCloser();
      this._runCallback();
    },

    _needToOpenAsModal: function() {
      return $(document).width() <= this.options.screenMWidth;
    },

    _buildDropdownModal: function() {
      this.dropdownModalView = new App.View.TagsModalDropdown({
        options: {
          dropdown: this.$dropdown
        },
        events: {
          'click .js-tags-select-closer' : this._closeProcess.bind(this)
        },
      });
    },

  });

})(this.App);