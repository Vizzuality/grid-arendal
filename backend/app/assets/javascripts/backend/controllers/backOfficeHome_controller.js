(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.BackOfficeHome = App.Controller.Page.extend({

    index: function() {
      var phrasesView = new App.View.Phrases({});
    },

    show: function() {
      var formView = new App.View.Form({});
    }
  });

})(this.App);
