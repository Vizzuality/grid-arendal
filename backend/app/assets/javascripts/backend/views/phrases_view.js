(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.Phrases = Backbone.View.extend({

    el: '.c-phrases',

    options: {
      changesLoopDelay: 10000,
      showedClass: "-showed"
    },

    initialize: function() {
      this.$firstPhrase = this.$el.children(":first");
      this._showFirstPhrase();
      this._runPhrasesChangesLoop();
    },

    _runPhrasesChangesLoop: function() {
      setInterval(this._changePhrase.bind(this), this.options.changesLoopDelay);
    },

    _showFirstPhrase: function () {
      this.$firstPhrase.addClass(this.options.showedClass);
    },

    _changePhrase: function () {
      var nextPhrase = this._getNextPhrase();
      this.$el.find("." + this.options.showedClass).removeClass(this.options.showedClass);
      nextPhrase.addClass(this.options.showedClass);
    },

    _getNextPhrase: function () {
      var nextChild = this.$el.find("." + this.options.showedClass).next();
      if (nextChild.length == 0) {
        return this.$firstPhrase;
      }

      return nextChild;
    }

  });

})(this.App);
