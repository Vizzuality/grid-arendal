(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.Form = Backbone.View.extend({

    el: 'form',

    events: {},

    initialize: function() {
      this._loadShortDescription();
      this._loadMediumEditor();
      this._loadTaggingSelect();
    },

    _loadShortDescription: function() {
      new App.Helper.FormInputCharLimited({
        el: $(this.$el.find('[data-type="short_description"]'))
      });
    },

    _loadMediumEditor: function () {
      new MediumEditor('.js-textarea-editable');
    },

    _loadTaggingSelect: function () {
      $(".js-select-tags").select2({
        tags: true
      }).bind(this);
    },

  });

})(this.App);
