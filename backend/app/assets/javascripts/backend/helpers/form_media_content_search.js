(function(App) {

  'use strict';

  App.Helper = App.Helper || {};

  App.Helper.FormMediaContentSearch = Backbone.View.extend({

    events: {
      'keyup': '_search',
      'click .js-select-media-content': '_onClickSetDataField'
    },

    options: {
      dataFieldTriggerClass: ".js-media-content-field",
      selectedClass: "-selected",
    },

    initialize: function() {
      if (!this.el) {
        return;
      }

      this._cache();
    },

    _cache: function () {
      this.$dataField = $(this.$el.find(this.options.dataFieldTriggerClass));
    },

    _search: function (e) {
      $.get('/manage/media_contents/search', {
        query: $(e.target).val(),
        selected_id: this.$dataField.val()
      });
    },

    _onClickSetDataField: function (e) {
      this.$dataField.val($(e.currentTarget).data("value"));
      this._removeHighlight();
      this._setHighlight($(e.currentTarget));
    },

    _removeHighlight: function () {
      this.$el.find("." + this.options.selectedClass).removeClass(this.options.selectedClass);
    },

    _setHighlight: function (element) {
      element.addClass(this.options.selectedClass);
    },

  });

})(this.App);
