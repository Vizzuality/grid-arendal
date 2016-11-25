(function(App) {

  'use strict';

  App.Helper = App.Helper || {};

  App.Helper.FormAdjustableInput = Backbone.View.extend({

    events: {},

    initialize: function() {
      if (!this.el) {
        return;
      }

      this.$el.autoGrowInput({ minWidth: 0, comfortZone: 0 });
    },


  });

})(this.App);
