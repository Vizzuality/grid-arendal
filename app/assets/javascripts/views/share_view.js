(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.Share = Backbone.View.extend({

    el: '.c-share',

    events: {
      'click .share-btn[data-key]' : '_onClickShareButton'
    },

    _onClickShareButton: function(e) {
      this._trackShare($(e.currentTarget).data('key'))
    },

    _trackShare: function (key) {
      ga('send', 'event', 'Share', 'Share on ' + key, window.location.href);
    }

  });

})(this.App);
