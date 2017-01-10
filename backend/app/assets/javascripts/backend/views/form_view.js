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
      selectTagsTriggerClass: ".js-select-tags",
      selectTagsInlineClass: "js-inline-tags",
      selectPhotoTriggerClass: ".js-select-photo",
    },

    initialize: function() {
      this._cache();
      this._loadHeaderAdjustableInput();
      this._loadLimitedInput();
      this._loadMediumEditor();
      this._loadSelect();
      this._loadDatepicker();
      this._loadTaggingSelect();
      this._loadPhotoSearch();
      this._loadFilesUploader();
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
          buttons: ['bold', 'italic', 'underline', 'unorderedlist', 'anchor', 'iframe', 'HTML', 'removeFormat']
        },
        extensions: {
          'iframe': new MediumButton({
            label:'iframe',
            action: function(html, mark, parent){
              var height = prompt("Please set the iframe height", "");

              return '<iframe src="' + html +'" width="100%" height="' + height + '"></iframe>';
            }
          }),
          'HTML': new MediumButton({
            label:'HTML',
            action: function(html, mark, parent){
              var pieces = html.split("<p>");
              var realContent = "";
              _.each(pieces, function(piece) {
                realContent += piece.replace('</p>', '');
              });

              return _.unescape(realContent);
            }
          }),
        },
        paste: {
          cleanPastedHTML: true
        },
      });
    },

    _loadSelect: function () {
      $(this.options.selectTriggerClass).select2({
        minimumResultsForSearch: Infinity
      });
    },

    _loadTaggingSelect: function () {
      _.each($(this.options.selectTagsTriggerClass), function(element) {
        var params = {
          tags: true
        };
        if(!$(element).hasClass(this.options.selectTagsInlineClass)) {
          params.createTag = function() {
            return undefined;
          };
        }
        $(element).select2(params);
      }.bind(this));
    },

    _loadPhotoSearch: function() {
      new App.Helper.FormPhotoSearch({
        el: $(this.$el.find(this.options.selectPhotoTriggerClass))
      });
    },

    _loadFilesUploader: function() {
      _.each($(this.$el.find('input[type="file"]')), function(element) {
        new App.Helper.FormInputFileUploader({
          el: element
        });
      }.bind(this));
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
