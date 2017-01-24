(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.About = App.Controller.Page.extend({

    index: function() {
      this.anchorsView = new App.View.Anchors({});
      new App.View.StaffCategories();
      if(this.isScreen_s) {
        this.initSliders();
      } else {
        var masonryLayout = $('.masonry-layout');
        var masonryCallback = this.getMasonryCallback();

        _.each(masonryLayout, function(element, index) {
          if($(element).find('.masonry-column').length === 0) {
            new App.View.Masonry({
              el: element,
              callback: masonryLayout.length === index + 1 ? masonryCallback : null
            });
          }
        });
      }
    },

    getMasonryCallback: function() {
      if($(window.location.hash).length > 0) {
        return this.goToBlock.bind(this, window.location.hash);
      }
      return null;
    },

    goToBlock: function (hash) {
      this.anchorsView.scrollHandler.scrollTo($(hash), false);
    },

    initSliders: function() {
      _.each($('.js_slider'), function(element) {
        if($(element).find(".js_slide").length > 0) {
          lory(element, {
            enableMouseEvents: true
          });
        }
      });
    }

  });

})(this.App);
