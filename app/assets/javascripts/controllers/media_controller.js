(function(App) {

  'use strict';

  App.Controller = App.Controller || {};

  App.Controller.Media = App.Controller.Page.extend({

    index: function() {
      if($('.masonry-layout').find('.masonry-column').length === 0) {
        new App.View.Masonry({
          el: '.masonry-layout'
        });
      }
      new App.View.Filters({
        options: {trackLabel: 'Media filters'}
      });

      this.scrollPaginationView = new App.View.ScrollPagination({
        callback: this._paginate.bind(this),
        options: {
          contentClass: ".l-main-content"
        }
      });
      this.videoThumbnailsView = new App.View.VideoThumbnails();
    },

    show: function() {
      this.videoThumbnailsView = new App.View.VideoThumbnails();
      new App.View.DownloadFilesView({
        pageTitle: $('h2').html()
      });

      if(this.isScreen_s) {
        this.initSliders();
      } else {
        _.each($('.masonry-layout'), function(element) {
          if($(element).find('.masonry-column').length === 0) {
            new App.View.Masonry({
              el: element
            });
          }
        });
      }

      $('.js_download-graphic').click(function() {
        $.get('/graphic_requests/new.js',
          { media_attachment_id: $(this).data('attachment-id') });
      });
    },

    _paginate: function() {
      var params = _.extend({}, App.Helper.Utils.getGetParams(), { page: this.scrollPaginationView.page });
      $.ajax({
        method: "GET",
        cache: true,
        url: '/resources/paginate',
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
            this.videoThumbnailsView.loadVideoThumbnails();
          }

        }.bind(this)
      });
    },

    initSliders: function() {
      _.each($('.js_slider'), function(element) {
        if($(element).find(".js_slide").length > 0) {
          lory(element, {
            enableMouseEvents: true,
            infinite: true
          });
        }
      }.bind(this));
    }

  });

})(this.App);
