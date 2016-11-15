(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.HomeSlider = Backbone.View.extend({

    el: 'l-header-home',

    options: {
      itemInterval: 5000,
      fadeTime: 1000,
      itemNumber: 4,
    },

    initialize: function() {
      this._triggerImageAnimation(this.options);
      // this._triggerBackgroundAnimation(this.options);
    },

    _triggerImageAnimation: function(options) {
      var currentItem = 0;
      var infiniteLoop = setInterval(function() {
        $('.bg').eq(currentItem).fadeOut(options.fadeTime);
        $('.l-main-content').fadeOut(options.fadeTime, function() {
          $(this).removeClass("-color-" + (currentItem + 1));
        });
        if (currentItem == options.itemNumber - 1) {
          currentItem = 0;
        } else {
          currentItem++;
        }
        $('.bg').eq(currentItem).fadeIn(options.fadeTime);
        $('.l-main-content').fadeIn(options.fadeTime, function() {
          $(this).addClass("-color-" + (currentItem + 1));
        });
      }, options.itemInterval)
    },

  });

})(this.App);
