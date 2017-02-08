(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.DownloadFilesView = Backbone.View.extend({

    el: '.download-links',

    events: {
      'click .btn' : '_onClickDownloadButton'
    },

    initialize: function(settings) {
      if (!settings.pageTitle) {
        return;
      }
      this.pageTitle = settings.pageTitle;
    },

    _onClickDownloadButton: function (e) {
      this._trackDownload($(e.currentTarget).data('key'));
    },

    _trackDownload: function (key) {
      ga('send', 'event', 'Downloads', this.pageTitle, key);
    }

  });

})(this.App);
