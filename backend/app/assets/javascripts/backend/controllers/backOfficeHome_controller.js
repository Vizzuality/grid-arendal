(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.BackOfficeHome = App.Controller.Page.extend({

    index: function() {
      console.log('hello from backoffice index')
    },

    show: function() {
      console.log('hello from backoffice show')
    }
  });

})(this.App);
