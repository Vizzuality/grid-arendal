(function(App) {

  'use strict';

  /**
   * Backbone way to create a Class
   * @param {Object} options
   */
  var Controller = function(options) {
    _.extend(this, options);
    this._instanceCommonViews();
    this.initialize.apply(this, arguments);
  };

  _.extend(Controller.prototype, Backbone.Events, {});

  Controller.extend = Backbone.Router.extend;

  /**
   * Page Controller Class
   */
  App.Controller = App.Controller || {};

  App.Controller.Page = Controller.extend({

    initialize: function() {
      new App.View.MobileMenu();
      new App.View.ScrollToTop();
      new App.View.Share();
      new App.View.Disqus();
      new App.View.SearchModal();
      this.isScreen_s = ($(window).width() < 768);
    },

    /**
     * Instance common and global view here
     * @return {[type]} [description]
     */
    _instanceCommonViews: function() {}

  });


})(this.App);
