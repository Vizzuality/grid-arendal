(function(App) {

  'use strict';

  App.Helper = App.Helper || {};

  App.Helper.FormDatepicker = Backbone.View.extend({

    initialize: function() {
      if (!this.el) {
        return;
      }

      this._loadDatepicker();
    },

    _loadDatepicker: function () {
      this.$el.find("input").datepicker({
        dateFormat: "yy-mm-dd"
      });
    }

  });

})(this.App);
