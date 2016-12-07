(function(App) {

  'use strict';

  App.Helper = App.Helper || {};

  App.Helper.FormAlbumPictures = Backbone.View.extend({

    events: {
      'click .pictures-grid': '_onClickSelectItem',
      'click .js-remove-pictures': '_onClickRemovePictures',
      'click .js-set-thumbnail': '_onClickSetThumbnail',
      'click .js-add-nested-fields': '_onClickAddNestedFields'
    },

    options: {
      itemsClass: "picture",
      selectedClass: "-selected",
      buttonDisableClass: "-disable",
      haveItemsClass: "-have-items",
      picturesGridClass: ".pictures-grid",
      hiddenClass: "-hidden",
      removeButtonTriggerClass: ".js-remove-pictures",
      setThumbnailTriggerClass: ".js-set-thumbnail"
    },

    selectedValues: [],

    initialize: function() {
      if (!this.el) {
        return;
      }
      this._cache();
    },

    _cache: function() {
      this.$picturesGrid = this.$el.find(this.options.picturesGridClass);
      this.$removeButton = this.$el.find(this.options.removeButtonTriggerClass);
      this.$setThumbnailButton = this.$el.find(this.options.setThumbnailTriggerClass);
    },

    _updateSelected: function(drop, value) {
      if (drop) {
        this.selectedValues = _.without(this.selectedValues, value);
      } else {
        this.selectedValues.push(value);
      }
    },

    _setSelected: function (element) {
      var parent = element.parent();
      var isSelected = parent.hasClass(this.options.selectedClass);
      parent.toggleClass(this.options.selectedClass);

      this._updateSelected(isSelected, element.data("media-content-id"));
    },

    _checkButtonsAvailability: function () {
      this._checkRemoveButtonAvailability();
      this._checksetThumbnailButtonAvailability();
    },

    _checkRemoveButtonAvailability: function () {
      if (this.selectedValues.length > 0) {
        this.$removeButton.removeClass(this.options.buttonDisableClass);
      } else {
        this.$removeButton.addClass(this.options.buttonDisableClass);
      }
    },

    _checksetThumbnailButtonAvailability: function () {
      if (this.selectedValues.length == 1) {
        this.$setThumbnailButton.removeClass(this.options.buttonDisableClass);
      } else {
        this.$setThumbnailButton.addClass(this.options.buttonDisableClass);
      }
    },

    _checksetPicturesGridPlaceholder: function () {
      if (this.$picturesGrid.find(".picture").length > 0) {
        this.$picturesGrid.addClass(this.options.haveItemsClass);
      } else {
        this.$picturesGrid.removeClass(this.options.haveItemsClass);
      }
    },

    _onClickSelectItem: function (e) {
      var target = $(e.target);
      if (target.hasClass(this.options.itemsClass)) {
        this._setSelected(target);
        this._checkButtonsAvailability();
      }
    },

    _onClickRemovePictures: function (e) {
      if (!$(e.target).hasClass(this.options.buttonDisableClass)) {
        _.each(this.selectedValues, function (value) {
          $('.nested-fields[data-media-content-id="' + value + '"] .remove_fields').click();
          this.$picturesGrid.find('[data-media-content-id="' + value + '"]').parent().remove();
          this._updateSelected(true, value);
        }.bind(this));
        this._checkButtonsAvailability();
        this._checksetPicturesGridPlaceholder();
      }
    },

    _onClickSetThumbnail: function (e) {
      if (!$(e.target).hasClass(this.options.buttonDisableClass)) {
        $('.nested-fields[data-media-content-id="' + this.selectedValues[0] + '"] .media_content_album_photos_main_photo_file input').click();
      }
    },

    _onClickAddNestedFields: function () {
      setTimeout(function () {
        var newForm = $(".nested-fields.tmp_form");
        this._initNewNestedField(newForm);
        this._showNewNestedField(newForm);
      }.bind(this), 100);
    },

    _getNewNestedFieldId: function () {
      var keys = $(".nested-fields.tmp_form .media_content_album_photos_title input").attr('id').split("_");
      return keys[5];
    },

    _initNewNestedField: function (newForm) {
      newForm.find(".js-form-save").on("click", { newForm: newForm }, function (e) {
        var pictureInput = newForm.find("input[type='file']");
        if (pictureInput[0].files && pictureInput[0].files[0]) {
          this._addPicturesGridItem(newForm, newForm.data("media-content-id"), pictureInput[0].files[0]);
        }
      }.bind(this));
      newForm.find(".js-form-cancel").on("click", { newForm: newForm }, function (e) {
        this._hideNewNestedField(e.data.newForm);
        setTimeout(function (newForm) {
          newForm.find('.remove_fields').click();
        }.bind(this), 500, e.data.newForm);
      }.bind(this));
      newForm.attr('data-media-content-id', this._getNewNestedFieldId());
      newForm.removeClass("tmp_form");

      new App.Helper.FormAdjustableInput({
        el: newForm.find(".js-adjustable-input")
      });
      new App.Helper.FormImgUploader({
        el: newForm.find('[data-type="picture"]')
      });
    },
    
    _showNewNestedField: function (newForm) {
      newForm.css("bottom", 0);
    },

    _hideNewNestedField: function (newForm) {
      newForm.attr("style", "");
      setTimeout(function (newForm) {
        newForm.addClass(this.options.hiddenClass);
      }.bind(this), 500, newForm);
    },

    _addPicturesGridItem: function (newForm, id, file) {
      var reader = new FileReader();

      reader.onload = function (e) {
        this.$picturesGrid
          .addClass(this.options.haveItemsClass)
          .append('<li><div class="picture" data-media-content-id="' + id + '" style="background-image: url(\'' + e.target.result + '\');"></div></li>');
        this._hideNewNestedField(newForm);
      }.bind(this);

      reader.readAsDataURL(file);
    }

  });

})(this.App);
