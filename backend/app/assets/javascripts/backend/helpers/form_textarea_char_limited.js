(function(App) {

  'use strict';

  App.Helper = App.Helper || {};

  App.Helper.FormInputCharLimited = Backbone.View.extend({

    events: {
      'keyup textarea' : '_updateCounterSpeaker',
      'change textarea' : '_updateCounterSpeaker'
    },

    initialize: function() {
      if (!this.el) {
        return;
      }
      this.cache();
      this._updateCounterSpeaker();
    },

    cache: function() {
      this.$textarea = this.$el.find('textarea');
      this.maxLength = this.$textarea.attr('maxLength');
      this.$charCounter = this.$el.find('.js-char-counter');
    },

    _updateCounterSpeaker: function () {
      this.$charCounter.html(this.$textarea.val().length + "/" + this.maxLength);
    },

  });

})(this.App);
