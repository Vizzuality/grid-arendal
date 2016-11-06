(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.TagsModalDropdown = App.Helper.Modal.extend({

    className: 'c-modal c-tags-dropdown-modal',

    initialize: function(settings) {
      this.constructor.__super__.initialize.apply(this);

      var opts = settings && settings.options ? settings.options : {};
      this.options = _.extend({}, this.defaults, opts);

      this.render();
      this.$body.append(this.$el);
    },

    render: function() {
      this.$el.html(this.options.dropdown);
    }

  });

})(this.App);
