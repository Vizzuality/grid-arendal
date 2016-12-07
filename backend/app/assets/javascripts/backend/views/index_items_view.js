(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.IndexItems = Backbone.View.extend({

    el: '.l-items-index',

    events: {
      'click .c-index-item': '_onClickHighlightItem',
      'click .js-select-tab': '_onClickSelectTab',
      'click .js-create-new': '_removeHighlight'
    },

    options: {
      linkerTriggerClass: "js-linker",
      selectedClass: "-selected",
      tabsClass: "tabs",
      tabsContentClass: "tabs-content",
      listClass: "items-list"
    },

    initialize: function() {
      this._loadRecoveredIndexStateEvents();
    },

    _loadRecoveredIndexStateEvents: function () {
      document.addEventListener('turbolinks:before-visit', function() {
        window.indexScrollTopPrevPage = $('.l-items-index .items-list').scrollTop();
        window.indexHighlightPrevPage = $('.l-items-index .c-index-item.-selected').data("item-id");
      });

      document.addEventListener('turbolinks:load', function() {
        $('.l-items-index .items-list').scrollTop(window.indexScrollTopPrevPage);

        if (typeof window.indexHighlightPrevPage != "undefined") {
          $('.l-items-index [data-item-id="' + window.indexHighlightPrevPage + '"]').addClass("-selected");
        }
      });
    },

    _onClickHighlightItem: function (e) {
      if ($(e.target).hasClass(this.options.linkerTriggerClass)) {
        this._removeHighlight();
        this._setHighlight($(e.currentTarget));
      }
    },

    _onClickSelectTab: function (e) {
      this._removeSelectedTab();
      this._setSelectedTab($(e.currentTarget));
    },

    _setSelectedTab: function (element) {
      element.addClass(this.options.selectedClass);
      this.$el.find("." + this.options.tabsContentClass + "[data-type='" + element.data("type") + "']").addClass(this.options.selectedClass);
    },

    _removeSelectedTab: function () {
      this.$el.find("." + this.options.tabsClass + " ." + this.options.selectedClass).removeClass(this.options.selectedClass);
      this.$el.find("." + this.options.tabsContentClass + "." + this.options.selectedClass).removeClass(this.options.selectedClass);
    },

    _setHighlight: function (element) {
      element.addClass(this.options.selectedClass);
    },

    _removeHighlight: function () {
      this.$el.find("." + this.options.listClass + " ." + this.options.selectedClass).removeClass(this.options.selectedClass);
    },

  });

})(this.App);
