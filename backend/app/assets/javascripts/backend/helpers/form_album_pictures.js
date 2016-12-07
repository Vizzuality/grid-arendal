(function(App) {

  'use strict';

  App.Helper = App.Helper || {};

  App.Helper.FormAlbumPictures = Backbone.View.extend({

    events: {
      'click .pictures-grid' : '_onClickSelectItem',
    },

    options: {
      itemsClass: "picture",
      selectedClass: "-selected"
    },

    pictures_selected: [],

    initialize: function() {
      if (!this.el) {
        return;
      }
      //this.cache();
    },

    cache: function() {
      this.$textarea = this.$el.find('textarea');
      this.maxLength = this.$textarea.attr('maxLength');
      this.$charCounter = this.$el.find('.js-char-counter');
    },

    _onClickSelectItem: function (e) {
      var target = $(e.target);
      if (target.hasClass(this.options.itemsClass)) {
        this._toggleHighlight(target);
      }
    },

    _toggleHighlight: function (element) {
      var parent = element.parent();
      if (parent.hasClass(this.options.selectedClass)) {
        this._removeHighlight(parent);
      } else {
        this._setHighlight(parent);
      }
    },

    _removeHighlight: function (element) {
      element.removeClass(this.options.selectedClass);
    },

    _setHighlight: function (element) {
      element.addClass(this.options.selectedClass);
    },

  });

})(this.App);
