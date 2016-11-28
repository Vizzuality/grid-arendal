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
      var mobileMenuView = new App.View.MobileMenu();
      // if (window.matchMedia("(max-width: 768px)").matches) {
        $('body').addClass('slide-' + (parseInt(Math.floor(Math.random() * 6)) + 1) );
      // }
    },

    /**
     * Instance common and global view here
     * @return {[type]} [description]
     */
    _instanceCommonViews: function() {
      // new App.View.Modal({ el: '#modalView' });
    }

  });


})(this.App);
