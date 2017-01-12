(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.ScrollToTop = Backbone.View.extend({

    el: 'body',

    events: {
      'click .js-btn-scroll-top' : 'onClickScrollToTop',
    },

    initialize: function() {
      if (!this.el) {
        return;
      }
    },

    onClickScrollToTop: function() {
      $("html, body").animate({ scrollTop: 0 }, "slow");
      return false;
    }

  });

})(this.App);
