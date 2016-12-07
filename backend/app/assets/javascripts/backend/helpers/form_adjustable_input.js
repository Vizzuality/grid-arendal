(function(App) {

  'use strict';

  App.Helper = App.Helper || {};

  App.Helper.FormAdjustableInput = Backbone.View.extend({

    events: {
      'focusin': '_setFocusHeader',
      'focusout': '_setFocusHeader',
    },

    initialize: function() {
      if (!this.el) {
        return;
      }

      this._cache();
      this.$el.autoGrowInput({ minWidth: 0, comfortZone: 0 });
    },

    _cache: function() {
      this.$headerIcon = this.$el.parent().next(".icon");
    },

    _setFocusHeader: function (e) {
      if (e.type == "focusin") {
        this.$headerIcon.css("opacity", 0);
      } else {
        this.$headerIcon.removeAttr("style");
      }
    }

  });

})(this.App);
