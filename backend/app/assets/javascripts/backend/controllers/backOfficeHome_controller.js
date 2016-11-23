(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.BackOfficeHome = App.Controller.Page.extend({

    index: function() {
      var phrasesView = new App.View.Phrases({});
      var indexItemView = new App.View.IndexItems({});
    },

    show: function() {
      var formView = new App.View.Form({});
      var indexItemView = new App.View.IndexItems({});
    }
  });

})(this.App);
