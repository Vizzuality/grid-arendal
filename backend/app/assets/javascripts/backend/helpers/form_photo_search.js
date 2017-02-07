(function(App) {

  'use strict';

  App.Helper = App.Helper || {};

  App.Helper.FormPhotoSearch = Backbone.View.extend({

    events: {
      'keyup': '_search',
      'click .js-select-photo': '_onClickSetDataField'
    },

    options: {
      dataFieldTriggerClass: ".js-photo-field",
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
      $.get('/manage/photos/search_thumbnails', {
        query: $(e.target).val(),
        selected_id: this.$dataField.val()
      });
    },

    _onClickSetDataField: function (e) {
      var currentTarget = $(e.currentTarget);

      this._removeHighlight();
      if(this.$dataField.val() == currentTarget.data("value")) {
        this.$dataField.removeAttr('value')
      } else {
        this.$dataField.val(currentTarget.data("value"));
        this._setHighlight($(e.currentTarget));
      }
    },

    _removeHighlight: function () {
      this.$el.find("." + this.options.selectedClass).removeClass(this.options.selectedClass);
    },

    _setHighlight: function (element) {
      element.addClass(this.options.selectedClass);
    },

  });

})(this.App);
