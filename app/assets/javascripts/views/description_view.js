(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.DescriptionView = Backbone.View.extend({

    events: {
      'click .read-more' : '_onClickShowAllDescription'
    },

    options: {
      descriptionClass: ".description",
      descriptionNeedMoreClass: "-need-more",
      descriptionShowMoreClass: "-show-more"
    },

    initialize: function() {
      this._cache();
      this._checkReadMore();
    },

    _cache: function() {
      this.$description = this.$el.find(this.options.descriptionClass);
      this.descriptionHeight = this.$description.height();
      this.descriptionRealHeight = this.$description[0].scrollHeight;
    },

    _checkReadMore: function() {
      if(this.descriptionRealHeight > this.descriptionHeight) {
        this.$description.addClass(this.options.descriptionNeedMoreClass);
      }
    },

    _onClickShowAllDescription: function () {
      this.$description
        .removeClass(this.options.descriptionNeedMoreClass)
        .addClass(this.options.descriptionShowMoreClass);
    }
  });

})(this.App);
