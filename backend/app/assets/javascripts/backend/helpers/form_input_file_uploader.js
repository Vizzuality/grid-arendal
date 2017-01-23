(function(App) {

  'use strict';

  App.Helper = App.Helper || {};

  App.Helper.FormInputFileUploader = Backbone.View.extend({

    events: {
      'change': '_onChange'
    },

    options: {
      fakeInputClass: ".fake-input",
      currentPictureClass: ".current_picture",
      verticalPictureClass: "-vertical",
      havePictureClass: "-have-picture"
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
      var image = new Image();
      image.src = e.target.result;

      image.onload = function() {
        var isVertical = this.height > this.width;
        var fakeInput = self.$el.siblings(self.options.fakeInputClass);
        var currentPicture = self.$el.siblings().find(self.options.currentPictureClass);

        fakeInput.addClass(self.options.havePictureClass);
        currentPicture.css("background-image", "url('" + e.target.result + "')");
        if(isVertical) {
          currentPicture.addClass(self.options.verticalPictureClass);
        }
      };
    },

    _setDocumentFilename: function (self, e) {
      self.$el.siblings().find(".text").html(e.target.fileName);
    },

  });

})(this.App);
