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
    },

    _setSpeaker: function(value) {
      this.$speakerText.html(value);
    },

    _setSelectValue: function(element) {
      this.$select
        .val($(element.currentTarget).data("value"))
        .change();
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
        this.$el.addClass(this.options.haveValueClass);
        this._setSpeaker($(e.currentTarget).val());
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
