(function(App) {

  'use strict';

  App.Helper = App.Helper || {};

  App.Helper.ScrollHandler = Backbone.View.extend({

    options: {
      animateDelay: 500
    },

    scrollTo: function(element) {
      var offsetTop = this._getElementTopOffset(element);
      this._animateScroll(offsetTop);
    },

    _getElementTopOffset: function(element) {
      return element.offset().top;
    },

    _animateScroll: function(offsetTop) {
      $('html, body').animate({
        scrollTop: offsetTop
      }, this.options.animateDelay);
    },

  });

})(this.App);
