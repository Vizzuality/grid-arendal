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
      var element = $(element.currentTarget);
      var value = element.data("value");
      var isSelected = element.hasClass(this.options.selectedClass);
      this._removeSelected();

      if(isSelected) {
        value = null;
      } else {
        element.addClass(this.options.selectedClass);
      }

      this.$select
        .val(value)
        .change();
    },

    _setHaveValue: function () {
      this.$el.addClass(this.options.haveValueClass);
    },

    _removeHaveValue: function () {
      this.$el.removeClass(this.options.haveValueClass);
    },

    _removeSelected: function () {
      this.$el.find('.' + this.options.selectedClass).removeClass(this.options.selectedClass);
    },

    _updateSelectedValue: function(value) {
      var selectedValues = [];
      if(value != null) {
        selectedValues = [value];
      }
      this.selectedValues = selectedValues;
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
        var value = this.$select.val();
        if(value === "") {
          this.$select.val(null).change();
        } else {
          this._updateSelectedValue(value);

          if(value === null) {
            this._removeHaveValue();
          } else {
            this._setHaveValue();
          }

          this._setSpeaker(this.$el.find("option:selected").text());
          this._closeProcess();
          this._runCallback();
        }


      }.bind(this));
    },

    _runCallback: function() {
      if (typeof this.options.callback == "function") {
        this.options.callback();
      }
    },

  });

})(this.App);
