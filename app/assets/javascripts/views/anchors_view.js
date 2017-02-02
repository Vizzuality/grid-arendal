(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.Anchors = Backbone.View.extend({

    el: '.anchors',

    events: {
      'click .js-anchor' : '_onClickMoveScrollTo'
    },

    initialize: function(settings) {
      var opts = settings && settings.options ? settings.options : {};
      this.options = _.extend({}, this.options, opts);

      this.scrollHandler = new App.Helper.ScrollHandler();
    },

    _onClickMoveScrollTo: function(e) {
      var section = $(e.currentTarget).data("section-belongs");
      this.scrollHandler.scrollTo($('[data-section="' + section + '"]'));
      this._trackAnchor(section);
    },

    _trackAnchor: function (section) {
      ga('send', 'event', this.options.trackLabel, 'Click Tab', section);
    }

  });

})(this.App);
