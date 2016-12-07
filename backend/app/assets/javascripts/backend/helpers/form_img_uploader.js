(function(App) {

  'use strict';

  App.Helper = App.Helper || {};

  App.Helper.FormImgUploader = Backbone.View.extend({

    events: {
      'change input[type="file"]': '_onChangeSetBackground'
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
      this.$currentPicture = $(this.$el.find(this.options.currentPictureClass));
    },

    _onChangeSetBackground: function (e) {
      if (e.target.files && e.target.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
          this.$currentPicture.css("background-image", "url('" + e.target.result + "')");
        }.bind(this);

        reader.readAsDataURL(e.target.files[0]);
      }
    },

  });

})(this.App);
