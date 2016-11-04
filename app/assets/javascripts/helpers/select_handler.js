(function(App) {

  'use strict';

  App.Helper = App.Helper || {};

  App.Helper.SelectHandler = Backbone.View.extend({

    options: {
      closerClass: "c-filters-closer",
      showDropdownClass: "-show-dropdown",
      haveValueClass: "-have-value"
    },

    initialize: function(settings) {
      if (!this.el) {
        return;
      }
      var opts = settings && settings.options ? settings.options : {};
      this.options = _.extend({}, this.options, opts);

      this._onClickOpenDropdown();
      this._onClickOptions();
      this._onChangeSelectValue();
    },

    _setSpeaker: function(value) {
      $(this.options.filter.triggerClass + " .speaker .text").html(value);
    },

    _setSelectValue: function(value) {
      $(this.options.filter.triggerClass + " select").val(value).change();
    },

    _openDropdown: function() {
      this.$el.addClass(this.options.showDropdownClass);
    },

    _closeDropdown: function() {
      this.$el.removeClass(this.options.showDropdownClass);
    },

    _showCloser: function() {
      $("<div></div>", {
        "class": this.options.closerClass,
        on: {
          click: function() {
            this._closeDropdown();
            this._destroyCloser();
          }.bind(this)
        }
      }).appendTo("body");
    },

    _destroyCloser: function() {
      $("." + this.options.closerClass).remove();
    },

    _onClickOpenDropdown: function() {
      $(this.options.filter.triggerClass + " .speaker").on('click', function() {
        this._openDropdown();
        this._showCloser();
      }.bind(this));
    },

    _onClickOptions: function() {
      $(this.options.filter.triggerClass + " .dropdown li").on('click', function(e) {
        this._setSelectValue($(e.currentTarget).data("value"));
      }.bind(this));
    },

    _onChangeSelectValue: function() {
      $(this.options.filter.triggerClass + " select").change(function(e) {
        this.$el.addClass(this.options.haveValueClass);
        this._setSpeaker($(e.currentTarget).val());
        this._closeDropdown();
        this._destroyCloser();
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
