(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.EventsModal = Backbone.View.extend({

    el: '.c-events-modal',

    events: {
      'click .js-btn-events-modal' : 'closeEventModal'
    },

    closeEventModal: function() {
      $('.c-events-modal').css('display', 'none');
    },

  });

})(this.App);
