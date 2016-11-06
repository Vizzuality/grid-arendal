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
      var isSelected = element.hasClass(this.options.selectedClass);
      element.toggleClass(this.options.selectedClass);

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
      this.$speakerText.html(this.selectedTags.join(", "));
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
