(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.HomeSlider = Backbone.View.extend({

    el: 'body',

    options: {
      itemInterval: 8000,
      fadeTime: 1500,
      itemNumber: 4,
    },

    initialize: function() {
      this._triggerImageAnimation(this.options);
      // this._triggerBackgroundAnimation(this.options);
    },

    _triggerImageAnimation: function(options) {
      var currentItem = 0;
      var infiniteLoop = setInterval(function() {
        $('.l-header-home .bg').eq(currentItem).fadeOut(options.fadeTime);
        $('.l-footer .bg').eq(currentItem).fadeOut(options.fadeTime);
        $('.l-main-content').removeClass("-color-" + (currentItem + 1));
        if (currentItem == options.itemNumber - 1) {
          currentItem = 0;
        } else {
          currentItem++;
        }
        $('.l-header-home .bg').eq(currentItem).fadeIn(options.fadeTime);
        $('.l-footer .bg').eq(currentItem).fadeIn(options.fadeTime);
        $('.l-main-content').addClass("-color-" + (currentItem + 1));
      }, options.itemInterval)
    },

  });

})(this.App);
