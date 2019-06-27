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
	// ページトップに戻るボタン
	$('#top_btn').click(function(){
		$('html, body').animate({
			'scrollTop' : 0
		}, 300);
		}
	);
	// timelineサムネイル画像 hover時のアニメーション
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


	// article#new Placeのデータ取得
	$('#place_save').click(function() {
		// ローディング画像表示
		$('#loading').show();
		// ローディング画像消去
		var d = new $.Deferred();
		d.done().then(function(){
			$('#loading').fadeOut();
		});

		// ユーサーの端末がGeolocation APIに対応しているか判別する
			// 対応している場合
			if (navigator.geolocation) {
				// 現在位置を取得する
				navigator.geolocation.getCurrentPosition(successGetPosition, failGetPosition, options);
					// 取得に成功した場合
					function successGetPosition(position) {
						// 緯度latitude・経度longitudeの取得
						var lat = position.coords.latitude;
						var lng = position.coords.longitude;
						$('#val_latitude').val(lat);
						$('#val_longitude').val(lng);
						// 緯度・経度を住所に変換
						// lat, lngの情報をまとめる
						var latlng = new google.maps.LatLng(lat, lng);
						// geocoderを使えるようにする
						var geocoder = new google.maps.Geocoder();
						 if (geocoder) {
						 	geocoder.geocode({'latLng':latlng}, function(results, status) {
						 		if (status == google.maps.GeocoderStatus.OK) {
						 			// 郵便番号を含めた住所を取得results[0]
						 			if (results[0].geometry) {
						 				var address = results[0].formatted_address.replace(/^日本, /, '');
						 				$('#val_place_address').val(address);
						 			}
						 		}
						 	});
						 }
						 d.resolve();
					}


					// 取得に失敗した場合
					function failGetPosition(error) {
						// エラーコード(error.code)の番号
						// 0:UNKNOWN_ERROR
						// 1:PERMISSION_DENIED
						// 2:POSITION_UNAVAILABLE
						// 3:TIMEOUT
						var errorInfo = [
							'原因不明のエラーが発生しました。',
							'位置情報の取得が許可されませんでした。',
							'電波状況などで位置情報が取得できませんでした。',
							'位置情報の取得に時間がかかり過ぎて、タイムアウトしました。'
						]
						var errorNo = error.code;
						var errorMessage ='[エラー番号:' + errorNo + ']\n' + errorInfo[errorNo];
						alert(errorMessage);
						d.resolve();
					}
					// 5000sを超える場合は処理を中止
					var options = {
						'timeout': 5000
					}
					return d.promise();

			}
			// 対応していない場合
			else {
				alert('お使いの端末は、GeoLacation APIに対応していません。');
				return d.promise();
			}


	});

  // timeline#show, new
  // Article画像を表示するモーダルを表示
  // 1枚ならば表示できたが、個別のデータが取得できずに諦めた
  // $(".article_image_modal_open").click(
  //   function() {
  //     $(".article_image_modal").fadeIn(300);
  //   });
  // $(".article_image_modal_hide").click(
  //   function() {
  //     $(".article_image_modal").fadeOut(300);
  //   });

	// timeline#edit
	$('#timeline_edit_modal').click(
		function(){
			$('.timeline_edit_wrapper').slideDown();
	});
	$('#timeline_edit_hide').click(
		function(){
			$('.timeline_edit_wrapper').slideUp();
	});
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