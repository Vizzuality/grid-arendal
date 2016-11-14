(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.Masonry = Backbone.View.extend({

    initialize: function() {
      if (!this.el) {
        return;
      }
      salvattore.init(this.el, this.showGrid.bind(this));
    },

    showGrid: function() {
      $(this.el).removeAttr("hidden");
    },

    addElements: function(mode, elements) {
      switch (mode) {
        case "prepend":
          salvattore.prependElements(this.el, elements);
          break;
        default:
          salvattore.appendElements(this.el, elements);
          break;
      }
    },

  });

})(this.App);
