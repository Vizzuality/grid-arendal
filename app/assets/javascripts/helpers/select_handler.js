(function(App) {

  'use strict';

  App.Helper = App.Helper || {};

  App.Helper.SelectHandler = Backbone.View.extend({

    options: {
      isOpen: false,
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

      this.selectedValues = [];

      this._cache();
      this._onClickOpenDropdown();
      this._onClickOptions();
      this._onChangeSelectValue();
      this._loadSearchEvents();
    },

    _cache: function() {
      this.key = this.$el.data("filter-key");
      this.$select = this.$el.find("select");
      this.$speaker = this.$el.find(".speaker");
      this.$speakerText = this.$el.find(".speaker .text");
      this.$dropdown = this.$el.find(".dropdown");
      this.$dropdownItems = this.$el.find(".js-dropdown-item");
      this.$searcher = this.$el.find(".search-box input");
      this.$searcherNoResultsSpeaker = this.$el.find(".no-results-speaker");
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
      if(value !== null) {
        selectedValues = [value];
      }
      this.selectedValues = selectedValues;
    },

    _openDropdown: function() {
      this.options.isOpen = true;
      this.$el.addClass(this.options.showDropdownClass);
      this._showCloser();
    },

    _closeDropdown: function() {
      this.options.isOpen = false;
      this.$el.removeClass(this.options.showDropdownClass);
    },

    _showCloser: function() {
      $("<div></div>", {
        "class": this.options.closerClass,
        on: {
          click: function() {
            this.closeProcess();
          }.bind(this)
        }
      }).appendTo("body");
    },

    _destroyCloser: function() {
      $("." + this.options.closerClass).remove();
    },

    closeProcess: function() {
      this._closeDropdown();
      this._destroyCloser();
    },

    _onClickOpenDropdown: function() {
      this.$speaker.on('click', function() {
        this.options.closeAllFilters();
        this._openDropdown();
      }.bind(this));
    },

    _onClickOptions: function() {
      this.$dropdownItems.on('click', function(e) {
        this._setSelectValue(e);
      }.bind(this));
    },

    _onChangeSelectValue: function() {
      this.$select.change(function() {
        var value = this.$select.val();
        if(value === "") {
          this.$select.val(null).change();
        } else {
          var selectedLabel = this.$el.find("option:selected").text();
          this._updateSelectedValue(value);

          if(value === null) {
            this._removeHaveValue();
          } else {
            this._setHaveValue();
          }

          this._setSpeaker(selectedLabel);
          this.closeProcess();
          this._runCallback(value === null ? value : selectedLabel);
        }
      }.bind(this));
    },

    _runCallback: function(value) {
      if (typeof this.options.callback == "function") {
        this.options.callback({
          key: this.key,
          value: value
        });
      }
    },

    _loadSearchEvents: function () {
      this.$searcher.on('keyup', function() {
        this._showSearcherResults();
      }.bind(this));
    },

    _showSearcherResults: function () {
      var haveResults = false;
      _.each(this.$dropdownItems, function(item) {
        var element = $(item),
          text = element.html().toLowerCase(),
          search = this.$searcher.val().toLowerCase();
        if(text.indexOf(search) !== -1) {
          element.show();
          haveResults = true;
        } else {
          element.hide();
        }
      }.bind(this));

      if(haveResults) {
        this.$searcherNoResultsSpeaker.hide();
      } else {
        this.$searcherNoResultsSpeaker.show();
      }
    }

  });

})(this.App);
