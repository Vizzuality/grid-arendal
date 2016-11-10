(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.Form = Backbone.View.extend({

    el: 'form',

    events: {},

    initialize: function() {
      this._loadShortDescription();
      this._loadMediumEditor();
    },

    _loadShortDescription: function() {
      new App.Helper.FormInputCharLimited({
        el: $(this.$el.find('[data-type="short_description"]'))
      });
    },

    _loadMediumEditor: function () {
      new MediumEditor('.js-textarea-editable');
    },

  });

})(this.App);
