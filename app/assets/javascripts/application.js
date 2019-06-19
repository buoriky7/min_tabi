// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//[Add]---
//= require jquery
//= require jquery_ujs
//= require cocoon
//[Add]---
//[Delete]turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(function () {
	$('#top_btn').click(function(){
		$('html, body').animate({
			'scrollTop' : 0
		}, 300);
		}
	);
	$('.timeline-thumbnail').hover(
		function() {
			$(this).find('.timeline-thumbnail-text_js').animate({
				fontSize: '120%',
				Color: 'red'
			}, 200);
		},
		function() {
			$(this).find('.timeline-thumbnail-text_js').animate({
				fontSize: '100%'
			}, 100);
		}
	);
});

// user#show
$(function () {
	$('#responsive_user_left_column').click(
		function() {
			$('.user_left_column').show();
		});
	$('.respoisive_hide_btn').click(
		function() {
			$('.user_left_column').hide();
		});
});