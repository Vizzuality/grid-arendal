(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.News = App.Controller.Page.extend({

    index: function(params) {
      if($('.masonry-layout').find('.masonry-column').length === 0) {
        new App.View.Masonry({
          el: '.masonry-layout'
        });
      }
    },

    show: function(params) { },

  });

})(this.App);
