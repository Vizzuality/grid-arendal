(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.IndexItems = Backbone.View.extend({

    el: '.l-items-index',

    events: {
      'click .c-index-item': '_onClickHighlightItem'
    },

    options: {
      linkerTriggerClass: "js-linker",
      selectedClass: "-selected"
    },

    _onClickHighlightItem: function (e) {
      if ($(e.target).hasClass(this.options.linkerTriggerClass)) {
        this._resetHighlight();
        this._setHighlight($(e.currentTarget));
      }
    },

    _setHighlight: function (element) {
      element.addClass(this.options.selectedClass);
    },

    _resetHighlight: function () {
      this.$el.find("." + this.options.selectedClass).removeClass(this.options.selectedClass);
    },

  });

})(this.App);
