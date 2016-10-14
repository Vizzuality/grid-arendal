(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.Publications = App.Controller.Page.extend({

    index: function(params) {
      console.log('publications#index');


    },

    show: function(params) {
      console.log('publications#show');
    },

  });

})(this.App);
