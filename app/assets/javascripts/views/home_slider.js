(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.HomeSlider = Backbone.View.extend({

    el: 'body',

    options: {
      itemInterval: 3000,
      fadeTime: 1500,
      itemNumber: 4,
      elements: [$('.l-header-home .bg'), $('.l-footer .bg')]
    },

    initialize: function() {
      this._triggerImageAnimation();
    },

    _triggerImageAnimation: function() {
      var currentItem = 0;
      var infiniteLoop = setInterval(function() {
        this._fadeOut(this.options.elements, currentItem);
        // headerHome.eq(currentItem).fadeOut(options.fadeTime);
        // footer.eq(currentItem).fadeOut(options.fadeTime);
        $('.l-main-content').removeClass("-color-" + (currentItem + 1));
        if (currentItem == this.options.itemNumber - 1) {
          currentItem = 0;
        } else {
          currentItem++;
        }
        this._fadeIn(this.options.elements, currentItem);
        // headerHome.eq(currentItem).fadeIn(options.fadeTime);
        // footer.eq(currentItem).fadeIn(options.fadeTime);
        $('.l-main-content').addClass("-color-" + (currentItem + 1));
      }.bind(this), this.options.itemInterval)
    },

    _fadeOut: function(elements, item) {
      elements.forEach( function(element) {
        element.eq(item).fadeOut(this.options.fadeTime);
      }.bind(this));
    },

    _fadeIn: function(elements, item) {
      elements.forEach( function(element) {
        element.eq(item).fadeIn(this.options.fadeTime);
      }.bind(this));
    },

  });

})(this.App);
