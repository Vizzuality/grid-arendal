(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.DownloadFilesView = Backbone.View.extend({

    el: '.download-links',

    events: {
      'click .btn' : '_onClickDownloadButton'
    },

    options: {
      downloadGraphicsButtonClass: 'js_download-graphic',
      downloadGraphicsModalClass: '.c-graphic-request-modal',
      downloadGraphicsInputClass: '.js_graphic-request-modal-input',
      downloadGraphicsSubmitClass: '.js_graphic-request-modal-submit',
      downloadGraphicsCloserClass: '.js_graphic-request-modal-closer',
      downloadGraphicsInputFilledClass: '-filled',
    },

    initialize: function(settings) {
      if (!settings.pageTitle) {
        return;
      }
      this.pageTitle = settings.pageTitle;
    },

    _onClickDownloadButton: function (e) {
      var target = $(e.currentTarget);

      this._trackDownload($(e.currentTarget).data('key'));
      if(target.hasClass(this.options.downloadGraphicsButtonClass)) {
        this._showGraphicModal(target);
      }
    },

    _trackDownload: function (key) {
      ga('send', 'event', 'Downloads', this.pageTitle, key);
    },

    _showGraphicModal: function (element) {
      $.get('/graphic_requests/new.js', {
        media_attachment_id: element.data('attachment-id'),
        graphic_id: element.data('graphic-id')
      },
      function() {
        this._loadGraphicModalEvents();
      }.bind(this));
    },

    _loadGraphicModalEvents: function () {
      $(this.options.downloadGraphicsCloserClass).on('click', function(){
        $(this.options.downloadGraphicsModalClass).remove();
      }.bind(this));

      $(this.options.downloadGraphicsInputClass).on('keyup', function(e) {
        var target = $(e.currentTarget);
        if(target.val() !== "") {
          target.addClass(this.options.downloadGraphicsInputFilledClass);
        } else {
          target.removeClass(this.options.downloadGraphicsInputFilledClass);
        }
        this._checkGraphicModalSubmitAvailability();
      }.bind(this));
    },

    _checkGraphicModalSubmitAvailability: function () {
      var disabled = $($(this.options.downloadGraphicsInputClass)[0]).val() === "" || $($(this.options.downloadGraphicsInputClass)[1]).val() === "";
      $(this.options.downloadGraphicsSubmitClass).prop("disabled", disabled);
    }
  });

})(this.App);
