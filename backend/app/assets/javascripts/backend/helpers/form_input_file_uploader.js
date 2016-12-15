(function(App) {

  'use strict';

  App.Helper = App.Helper || {};

  App.Helper.FormInputFileUploader = Backbone.View.extend({

    events: {
      'change': '_onChange'
    },

    options: {
      currentPictureClass: ".current_picture"
    },

    initialize: function() {
      if (!this.el) {
        return;
      }

      this._cache();
    },

    _cache: function () {
      this.fieldType = this.$el.closest('.field').attr("data-type");
    },

    _onChange: function (e) {
      switch (this.fieldType) {
        case "picture":
          this._loadFileReaderAndRunCallback(e, this._setPictureBackground);
          break;
        case "attach_documents":
          this._loadFileReaderAndRunCallback(e, this._setDocumentFilename);
          break;
      }
    },

    _loadFileReaderAndRunCallback: function (e, callback) {
      if (e.target.files && e.target.files[0]) {
        var reader = new FileReader();

        reader.fileName = e.target.files[0].name;
        reader.onload = function (e) {
          callback(this, e);
        }.bind(this);

        reader.readAsDataURL(e.target.files[0]);
      }
    },

    _setPictureBackground: function (self, e) {
      self.$el.siblings().find(self.options.currentPictureClass).css("background-image", "url('" + e.target.result + "')");
    },

    _setDocumentFilename: function (self, e) {
      self.$el.siblings().find(".text").html(e.target.fileName);
    },

  });

})(this.App);
