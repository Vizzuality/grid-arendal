(function(App) {

  'use strict';

  var MobileMenu = Backbone.View.extend({

    el: 'body',

    events: {
      'click .js-btn-mobile-menu' : 'onClickChangeStatus',
      'click .js-btn-close' : 'onClickChangeStatus'
    },

    initialize: function() {
      this.status =  new (Backbone.Model.extend({
        defaults: {
          hidden: true
        }
      }));

      this._listeners();
    },

    _listeners: function() {
      this.status.on('change:hidden', this.toggleMenuPanel, this);
    },

    onClickChangeStatus: function() {
      var hidden = this.status.get('hidden');
      this.status.set('hidden', !hidden);
    },

    toggleMenuPanel: function() {
      var hidden = !!this.status.get('hidden');

      this.$('html').toggleClass('-menu-open', !hidden);
      this.$('body').toggleClass('-menu-open', !hidden);
      this.$('.c-mobile-menu').toggleClass('-is-open', !hidden);
      this.$('.c-menu').toggleClass('-is-open', !hidden);
    }
  });

  var mobileMenu = new MobileMenu();

})(this.App);
