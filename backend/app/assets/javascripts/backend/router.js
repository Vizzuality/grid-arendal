(function(App) {

  'use strict';

  App.Router = Backbone.Router.extend({

    /**
     * Inspired by Rails, we have a routes file that specifies these routes
     * and any additional route parameters.
     * @type {Object}
     */
    routes: {
      'manage': 'BackOfficeHome#index',
      'manage/activities': 'BackOfficeHome#index',
      'manage/activities/:id(/:action)': 'BackOfficeHome#show',
      'manage/activities/new': 'BackOfficeHome#show',
      'manage/publications': 'BackOfficeHome#index',
      'manage/publications/:id(/:action)': 'BackOfficeHome#show',
      'manage/publications/new': 'BackOfficeHome#show',
      'manage/news_articles': 'BackOfficeHome#index',
      'manage/news_articles/:id(/:action)': 'BackOfficeHome#show',
      'manage/news_articles/new': 'BackOfficeHome#show',
      'manage/photos': 'BackOfficeHome#index',
      'manage/photos/:id/edit': 'BackOfficeHome#show',
      'manage/albums': 'BackOfficeHome#index',
      'manage/albums/:id/edit': 'BackOfficeHome#show',
      'manage/videos': 'BackOfficeHome#index',
      'manage/videos/:id/edit': 'BackOfficeHome#show',
      'manage/videos/new': 'BackOfficeHome#show',
      'manage/graphics': 'BackOfficeHome#index',
      'manage/graphics/:id/edit': 'BackOfficeHome#show',
      'manage/graphics/new': 'BackOfficeHome#show',
      'manage/about_sections': 'BackOfficeHome#index',
      'manage/about_sections/:id(/:action)': 'BackOfficeHome#show',
      'manage/about_sections/new': 'BackOfficeHome#show',
      'manage/partners': 'BackOfficeHome#index',
      'manage/partners/:id(/:action)': 'BackOfficeHome#show',
      'manage/partners/new': 'BackOfficeHome#show',
      'manage/events': 'BackOfficeHome#index',
      'manage/events/:id(/:action)': 'BackOfficeHome#show',
      'manage/events/new': 'BackOfficeHome#show',
      'manage/users': 'BackOfficeHome#index',
      'manage/users/:id(/:action)': 'BackOfficeHome#show',
      'manage/users/new': 'BackOfficeHome#show',
      'manage/content_types': 'BackOfficeHome#index',
      'manage/content_types/:id(/:action)': 'BackOfficeHome#show',
      'manage/content_types/new': 'BackOfficeHome#show',
      'manage/tags': 'BackOfficeHome#index',
      'manage/tags/:id(/:action)': 'BackOfficeHome#show',
      'manage/tags/new': 'BackOfficeHome#show',
    },

    initialize: function() {
      // We are going to save params in model
      this.params = new (Backbone.Model.extend());
      // Listening events
      this.params.on('change', _.bind(this.updateUrl, this));
      // Global event to update params from external actions
      App.Events.on('params:update', _.bind(this.updateParams, this));
    },

    /**
     * Get URL params
     * @return {Object}
     */
    getParams: function(routeParams) {
      return this._unserializeParams(routeParams);
    },

    /**
     * Update model with new params
     * @param  {Object} params
     */
    updateParams: function(params) {
      this.params.clear().set(params, { silent: true });
      this.updateUrl();
    },

    /**
     * Change URL with current params
     */
    updateUrl: function() {
      var url = location.pathname.slice(1) + this._serializeParams();
      this.navigate(url, { trigger: false });
    },

    /**
     * Transform URL string params to object
     * @param  {String} routeParams
     * @return {Object}
     * @example https://medialize.github.io/URI.js/docs.html
     */
    _unserializeParams: function(routeParams) {
      var params = {};
      if (typeof routeParams === 'string' && routeParams.length) {
        var uri = new URI('?' + routeParams);
        params = uri.search(true);
      }
      return params;
    },

    /**
     * Transform object params to URL string
     * @return {String}
     * @example https://medialize.github.io/URI.js/docs.html
     */
    _serializeParams: function() {
      var uri = new URI();
      uri.search(this.params.attributes);
      return uri.search();
    }

  });

})(this.App);
