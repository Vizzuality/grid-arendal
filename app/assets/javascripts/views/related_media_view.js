(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.RelatedMedia = Backbone.View.extend({

    el: '.js_slider[data-slider-type="related-media"]',

    events: {
      'click .c-related-media-item' : 'onClickGoToMediaItem'
    },

    onClickGoToMediaItem: function(e) {
      const $slider = document.querySelector('.js_slider');
      if ( $(e.currentTarget).parent().hasClass('active') ) {
        if(e.originalEvent != null && !e.originalEvent.defaultPrevented) {
          window.location.href = $(e.currentTarget).data('link');
        }
      } else {
      }
    },

  });

})(this.App);
