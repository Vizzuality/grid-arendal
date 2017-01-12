(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.RelatedMedia = Backbone.View.extend({

    el: '.js_slider[data-slider-type="related-media"]',

    events: {
      'click .c-related-media-item' : 'onClickGoToMediaItem'
    },

    initialize: function(settings) {
      this.slider = settings.slider;
    },

    onClickGoToMediaItem: function(e) {
      if ( $(e.currentTarget).parent().hasClass('active') ) {
        if(e.originalEvent != null && !e.originalEvent.defaultPrevented) {
          window.location.href = $(e.currentTarget).data('link');
        }
      } else {
        var selectedSlide = $(e.currentTarget)[0].id;
        this.slider.slideTo(parseInt(selectedSlide));
      }
    },

  });

})(this.App);
