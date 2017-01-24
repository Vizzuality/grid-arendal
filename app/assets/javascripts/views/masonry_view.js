(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.Masonry = Backbone.View.extend({

    initialize: function(settings) {
      if (!this.el) {
        return;
      }
      this.callback = settings.callback ? settings.callback : null;
      this._loadGrid();
    },

    _loadGrid:function () {
      salvattore.init(this.el, this._salvattoreCallback.bind(this));
    },

    _salvattoreCallback: function () {
      this.showGrid();
      if(this.callback !== null) {
        this.callback();
      }
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
