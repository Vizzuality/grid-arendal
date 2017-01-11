(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.HomeVideo = Backbone.View.extend({

    el: 'body',

    events: {
      'click .js-home-video-play' : 'onClickOpenVideo',
      'click .js-home-video-veil' : 'onClickCloseVideo'
    },

    options: {
      isIframeLoaded: false,
      homeVideoClass: ".c-home-video",
      homeVideoContainerClass: ".js-home-video-container"
    },

    initialize: function() {
      this._cache();
    },

    _cache: function() {
      this.$homeVideo = this.$el.find(this.options.homeVideoClass);
      this.$homeVideoContainer = this.$el.find(this.options.homeVideoContainerClass);
      this.$html = $('html');
      this.$body = $('body');
    },

    onClickOpenVideo: function(e) {
      this.$homeVideo.show().animate({
        opacity: 1
      }, 300, function() {
        this._checkIframe();
      }.bind(this));
      this._fixBackground();
    },

    onClickCloseVideo: function(e) {
      this.$homeVideo.animate({
        opacity: 0
      }, 300, function() {
        $(this).hide();
      });
      this._fixBackground();
    },

    _fixBackground: function() {
      this.$html.toggleClass('-fixed');
      this.$body.toggleClass('-fixed');
    },

    _checkIframe: function() {
      if(!this.options.isIframeLoaded) {
        this.$homeVideoContainer.html(this._getIframeHTML());
        this.options.isIframeLoaded = true;
      }
    },

    _getIframeHTML: function () {
      return '<iframe src="https://player.vimeo.com/video/' + this.$homeVideoContainer.data('video-id') + '?title=0&byline=0&portrait=0" width="100%" height="100%" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>'
    },

  });

})(this.App);
