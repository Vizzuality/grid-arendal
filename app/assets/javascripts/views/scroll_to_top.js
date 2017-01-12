(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.ScrollToTop = Backbone.View.extend({

    defaults: {
      showPos: 700
    },

    el: 'body',

    events: {
      'click .js-btn-scroll-top' : '_onClickScrollToTop',
    },

    initialize: function() {
      if (!this.el) {
        return;
      }
      this._cache();
      this._loadOnScrollEvent();
    },

    _cache: function() {
      this.$scroll = $('.c-scroll-to-top');
    },

    _onClickScrollToTop: function() {
      $("html, body").animate({ scrollTop: 0 }, "slow");
      return false;
    },

    _loadOnScrollEvent: function() {
      $(window).on('scroll', function() {

        var currentScroll = $(window).scrollTop();
        var scrollBottom = $(document).height() - window.innerHeight - currentScroll;

        if ( currentScroll < this.defaults.showPos ) {
          this.$scroll.css({
            opacity: 0
          });
        } else if (currentScroll >= this.defaults.showPos && scrollBottom > 450 ) {
          this.$scroll.css({
            opacity: 1,
            position: 'fixed'
          });
        } else {
          this.$scroll.css({
            position: 'absolute',
            opacity: 1
          });
        }

      }.bind(this));
    }

  });

})(this.App);
