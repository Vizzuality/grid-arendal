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
      descriptionShowMoreClass: "-show-more",
      sidebarClass: ".sidebar",
      sidebarContentClass: ".sidebar-content",
      sidebarContentFixedClass: "-fixed",
      sidebarContentFixolutedClass: "-fixoluted",
    },

    initialize: function() {
      this._cache();
      this._checkReadMore();
      this._loadStickySidebarEvent();
    },

    _cache: function() {
      this.$description = this.$el.find(this.options.descriptionClass);
      this.descriptionHeight = this.$description.height();
      this.descriptionRealHeight = this.$description[0].scrollHeight;
      this.$sidebar = this.$el.find(this.options.sidebarClass);
      this.sidebarHeight = this.$sidebar[0].scrollHeight;
      this.sidebarOffsetTop = this.$sidebar.offset().top;
      this.$sidebarContent = this.$el.find(this.options.sidebarContentClass);
      this.sidebarContentHeight = this.$sidebarContent[0].scrollHeight;
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
    },

    _loadStickySidebarEvent: function () {
      $(window).scroll(function () {
        var scrollTop = $(window).scrollTop();
        var sidebarLimit = this.sidebarOffsetTop + this.sidebarHeight - this.sidebarContentHeight;

        this.$sidebarContent
          .removeClass(this.options.sidebarContentFixedClass)
          .removeClass(this.options.sidebarContentFixolutedClass);

        if(scrollTop >= this.sidebarOffsetTop
          && scrollTop <= sidebarLimit
        ) {
          this.$sidebarContent.addClass(this.options.sidebarContentFixedClass);
        } else  if(scrollTop > sidebarLimit) {
          this.$sidebarContent.addClass(this.options.sidebarContentFixolutedClass);
        }
      }.bind(this));
    }

  });

})(this.App);
