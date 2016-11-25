(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.Form = Backbone.View.extend({

    el: 'form',

    events: {
      'click .js-cancel-process': '_cancelProcess'
    },

    options: {
      adjustableTriggerClass: ".js-adjustable-input",
      mediumEditorTriggerClass: ".js-textarea-editable",
      selectTriggerClass: ".js-select",
      selectTagsTriggerClass: ".js-select-tags"
    },

    initialize: function() {
      this._loadAdjustableInput();
      this._loadLimitedInput();
      this._loadMediumEditor();
      this._loadSelect();
      this._loadTaggingSelect();
    },

    _loadAdjustableInput: function () {
      new App.Helper.FormAdjustableInput({
        el: $(this.$el.find(this.options.adjustableTriggerClass))
      });
    },

    _loadLimitedInput: function() {
      new App.Helper.FormInputCharLimited({
        el: $(this.$el.find('[data-type="limited_input"]'))
      });
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

    _cancelProcess: function () {
      location.reload();
    },

  });

})(this.App);
