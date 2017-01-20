(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.VideoThumbnails = Backbone.View.extend({

    el: 'body',

    options: {
      cardPictureClass: ".js-video-thumbnail[data-video-id]",
      cardVideoDataAttr: "video-id",
      cardVideoProviderDataAttr: "video-provider",
      vimeoAPIUrl: "http://vimeo.com/api/v2/video/_VIDEO_ID_.json",
      youtubeImageUrl: "https://img.youtube.com/vi/_VIDEO_ID_/hqdefault.jpg"
    },

    initialize: function() {
      this.loadVideoThumbnails();
    },

    loadVideoThumbnails: function() {
      var cards = $(this.options.cardPictureClass);
      _.each(cards, function (card) {
        switch($(card).data(this.options.cardVideoProviderDataAttr)) {
          case "youtube":
            this._getYoutubeThumbnail($(card).data(this.options.cardVideoDataAttr));
            break;
          case "vimeo":
            this._getVimeoThumbnail($(card).data(this.options.cardVideoDataAttr));
            break;
        }
      }.bind(this));
    },

    _getYoutubeThumbnail: function (video_id) {
      this._setThumbnail(video_id, this.options.youtubeImageUrl.replace("_VIDEO_ID_", video_id));
    },

    _getVimeoThumbnail: function (video_id) {
      $.ajax({
        type:'GET',
        url: this.options.vimeoAPIUrl.replace("_VIDEO_ID_", video_id),
        jsonp: 'callback',
        dataType: 'jsonp',
        success: function(data){
          this._setThumbnail(video_id, data[0].thumbnail_large);
        }.bind(this)
      });
    },

    _setThumbnail: function (video_id, thumbnail_url) {
      $('[data-' + this.options.cardVideoDataAttr + '="' + video_id + '"]')
        .css("background-image", "url('" + thumbnail_url + "')")
        .removeAttr("data-" + this.options.cardVideoDataAttr);
    }

  });

})(this.App);
