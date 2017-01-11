(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.Activities = App.Controller.Page.extend({

    options: {
      sliderContentCardType: "card",
      sliderMediaItemType: "related-media"
    },

    index: function(params) {
      if($('.masonry-layout').find('.masonry-column').length === 0) {
        new App.View.Masonry({
          el: '.masonry-layout'
        });
      }
      new App.View.MediaFilters({
        callback: this._filter.bind(this)
      });
      this.scrollPaginationView = new App.View.ScrollPagination({
        callback: this._paginate.bind(this),
        options: {
          contentClass: ".l-main-content"
        }
      });
    },

    show: function(params) {
      new App.View.Anchors({});
      this.initSliders();
      if(!this.isScreen_s) {
        _.each($('.masonry-layout'), function(element) {
          if($(element).find('.masonry-column').length === 0) {
            new App.View.Masonry({
              el: element
            });
          }
        });
      }
    },

    _filter: function() {
      jQuery.ajaxSetup({cache: true});
      $.getScript($(location).attr('href'));
      this.scrollPaginationView._initVariables();
      return false;
    },

    _paginate: function() {
      var params = _.extend({}, App.Helper.Utils.getGetParams(), { page: this.scrollPaginationView.page });
      $.ajax({
        method: "GET",
        cache: true,
        url: '/activities/paginate',
        data: params,
        beforeSend: function() {
          this.scrollPaginationView.showLoader();
        }.bind(this),
        complete: function(response) {
          this.scrollPaginationView.toggleDoingCallback();
          this.scrollPaginationView.hideLoader();

          if(response.status === 204) {
            this.scrollPaginationView.toggleBlockPagination();
          } else {
            this.scrollPaginationView._setHash();
          }

        }.bind(this)
      });
    },

    initSliders: function() {
      _.each($('.js_slider'), function(element) {
        var sliderType = $(element).data("slider-type");
        var needLoadSlider = true;

        if(sliderType == this.options.sliderContentCardType && !this.isScreen_s) {
          needLoadSlider = false;
        }

        if(needLoadSlider) {
          lory(element, {
            enableMouseEvents: true
          });
        }
      }.bind(this));
    }

  });

})(this.App);
