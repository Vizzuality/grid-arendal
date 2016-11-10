(function(App) {

  'use strict';

  App.Helper = App.Helper || {};

  App.Helper.FormInputCharLimited = Backbone.View.extend({

    events: {
      'change textarea' : '_onChangeTextareaValue'
    },

    _onChangeTextareaValue: function() {
      console.log(this.$el);
    },

  });

})(this.App);
