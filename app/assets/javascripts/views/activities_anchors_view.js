(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.Anchors = Backbone.View.extend({

    el: '.anchors',

    events: {
      'click .js-anchor' : '_onClickMoveScrollTo'
    },

    initialize: function() {
      this.scrollHandler = new App.Helper.ScrollHandler();
    },

    _onClickMoveScrollTo: function(e) {
      var section = $(e.currentTarget).data("section-belongs");
      this.scrollHandler.scrollTo($('[data-section="' + section + '"]'));
    },

  });

})(this.App);
