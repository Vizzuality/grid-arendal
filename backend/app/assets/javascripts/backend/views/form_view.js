(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.Form = Backbone.View.extend({

    el: 'form',

    events: {
      'click .js-cancel-process': '_cancelProcess'
    },

    options: {
      mediumEditorTriggerClass: ".js-textarea-editable",
      selectTagsTriggerClass: ".js-select-tags"
    },

    initialize: function() {
      this._loadShortDescription();
      this._loadMediumEditor();
      this._loadTaggingSelect();
      this._loadFileInput();
    },

    _loadShortDescription: function() {
      new App.Helper.FormInputCharLimited({
        el: $(this.$el.find('[data-type="short_description"]'))
      });
    },

    _loadMediumEditor: function () {
      new MediumEditor(this.options.mediumEditorTriggerClass, {
        toolbar: {
          buttons: ['bold', 'italic', 'underline', 'h1', 'h2', 'quote', 'anchor']
        }
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
