(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.Form = Backbone.View.extend({

    el: 'form',

    options: {
      formHeaderIconClass: ".form_header .icon",
      adjustableTriggerClass: ".js-adjustable-input",
      mediumEditorTriggerClass: ".js-textarea-editable",
      selectTriggerClass: ".js-select",
      selectTagsTriggerClass: ".js-select-tags"
    },

    initialize: function() {
      this._cache();
      this._loadHeaderAdjustableInput();
      this._loadLimitedInput();
      this._loadMediumEditor();
      this._loadSelect();
      this._loadDatepicker();
      this._loadTaggingSelect();
      this._loadMediaContentSearch();
      this._loadAlbumPictures();
    },

    _cache: function () {
      this.$headerIcon = $(this.$el.find(this.options.formHeaderIconClass));
    },

    _loadHeaderAdjustableInput: function () {
      _.each($(this.$el.find(this.options.adjustableTriggerClass)), function(element) {
        new App.Helper.FormAdjustableInput({
          el: element
        });
      }.bind(this));
    },

    _loadLimitedInput: function() {
      new App.Helper.FormInputCharLimited({
        el: $(this.$el.find('[data-type="limited_input"]'))
      });
    },

    _loadDatepicker: function() {
      _.each($(this.$el.find('[data-type="datepicker"]')), function(element) {
        new App.Helper.FormDatepicker({
          el: element
        });
      }.bind(this));
    },

    _loadMediumEditor: function () {
      new MediumEditor(this.options.mediumEditorTriggerClass, {
        toolbar: {
          buttons: ['bold', 'italic', 'underline', 'h1', 'h2', 'quote', 'anchor']
        }
      });
    },

    _loadSelect: function () {
      $(this.options.selectTriggerClass).select2({
        minimumResultsForSearch: Infinity
      });
    },

    _loadTaggingSelect: function () {
      $(this.options.selectTagsTriggerClass).select2({
        tags: true
      });
    },

    _loadMediaContentSearch: function() {
      new App.Helper.FormMediaContentSearch({
        el: $(this.$el.find('[data-type="media-content"]'))
      });
    },

    _loadAlbumPictures: function() {
      new App.Helper.FormAlbumPictures({
        el: $(this.$el.find('[data-type="album_pictures"]'))
      });
    },

    _setFocusHeader: function (e) {
      if (e.type == "focusin") {
        this.$headerIcon.css("opacity", 0);
      } else {
        this.$headerIcon.removeAttr("style");
      }
    },

  });

})(this.App);
