(function(App) {

  'use strict';

  App.View = App.View || {};

  App.View.Disqus = Backbone.View.extend({

    el: '.info-links',

    events: {
      'click #feedback-trigger' : '_onClickFeedbackLink'
    },

    _onClickFeedbackLink: function(e) {
      e.preventDefault();
			if($('#disqus_thread').is(':visible')) {
				$('#disqus_thread').hide();
			} else {
				$('#disqus_thread').show();
				$('html, body').animate({
					scrollTop: $('#disqus_thread').offset().top
				}, 2000);
			}
    }

  });

})(this.App);
