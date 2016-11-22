(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.IndexItems = Backbone.View.extend({

    el: '.l-items-index',

    events: {
      'click .c-index-item': '_onClickHighlightItem',
      'click .js-create-new': '_removeHighlight'
    },

    options: {
      linkerTriggerClass: "js-linker",
      selectedClass: "-selected"
    },

    _onClickHighlightItem: function (e) {
      if ($(e.target).hasClass(this.options.linkerTriggerClass)) {
        this._removeHighlight();
        this._setHighlight($(e.currentTarget));
      }
    },

    _setHighlight: function (element) {
      element.addClass(this.options.selectedClass);
    },

    _removeHighlight: function () {
      this.$el.find("." + this.options.selectedClass).removeClass(this.options.selectedClass);
    },

  });

})(this.App);
