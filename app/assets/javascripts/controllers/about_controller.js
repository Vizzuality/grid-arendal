(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.About = App.Controller.Page.extend({

    index: function() {
      new App.View.Anchors({});
    },

  });

})(this.App);
