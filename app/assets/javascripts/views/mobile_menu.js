(function(App) {

  'use strict';

  var MobileMenu = Backbone.View.extend({

    el: 'body',

    events: {
      'click .btn-mobile-menu' : 'onClickToggleMenu',
      'click .btn-close' : 'onClickToggleMenu'
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
      this.status.on('change:hidden', this.changedStatus, this);
    },

    onClickToggleMenu: function() {
      var hidden = this.status.get('hidden');
      this.status.set('hidden', !hidden);
    },

    changedStatus: function() {
      this.$('html').toggleClass('-menu-open');
      this.$('body').toggleClass('-menu-open');
      this.$('.c-mobile-menu').toggleClass('-is-open');
      this.$('.c-menu').toggleClass('-is-open');
    }
  });

  var mobileMenu = new MobileMenu();

})(this.App);
