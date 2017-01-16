(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.VideoThumbnails = Backbone.View.extend({

    el: 'body',

    options: {
      cardPictureClass: ".card-pic[data-video-id]",
      cardPictureDataAttr: "video-id",
      vimeoAPIUrl: "http://vimeo.com/api/v2/video/"
    },

    initialize: function() {
      this.loadVideoThumbnails();
    },

    loadVideoThumbnails: function() {
      var cards = $(this.options.cardPictureClass);
      _.each(cards, function (card) {
        this._getVimeoThumbnail($(card).data(this.options.cardPictureDataAttr));
      }.bind(this));
    },

    _getVimeoThumbnail: function (video_id) {
      $.ajax({
        type:'GET',
        url: this.options.vimeoAPIUrl + video_id + '.json',
        jsonp: 'callback',
        dataType: 'jsonp',
        success: function(data){
          this._setThumbnail(video_id, data[0].thumbnail_large);
        }.bind(this)
      });
    },

    _setThumbnail: function (video_id, thumbnail_url) {
      $('[data-' + this.options.cardPictureDataAttr + '="' + video_id + '"]')
        .css("background-image", "url('" + thumbnail_url + "')")
        .removeAttr("data-" + this.options.cardPictureDataAttr);
    }

  });

})(this.App);
