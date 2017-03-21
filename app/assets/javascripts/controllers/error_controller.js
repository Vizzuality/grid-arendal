(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.Error = App.Controller.Page.extend({

    index: function() {
      new App.View.SearchInput();
    },

  });

})(this.App);
