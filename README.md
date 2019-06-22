# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

##使用素材
浅草岳から見る風景と守門岳（福島県）のフリー画像（写真）
https://www.pakutaso.com/20190648165post-21303.html

Ajaxload
http://www.ajaxload.info/

##メモ
管理者：User(3)テスト用管理者

APIキーの環境変数化）
.bash_profile ファイルにGOOGLE_MAP_APIのキーを保存済み。
vagrantリロードして使えなくなった場合は、もう一度exportするか、メンターさんに相談すること
使用するときは以下のように記述
<% ENV["GOOGLE_MAP_API_KEY"] %>

##参考サイト
###GOOGLE_MAP_API
GOOGLE_MAP_APIキーの取得
https://qiita.com/tiara/items/4a1c98418917a0e74cbb#%E3%81%99%E3%82%8B%E3%81%93%E3%81%A8
必要モデルの作成
https://qiita.com/nojinoji/items/8b68abc0217bebb1f0c3
現在位置の取得
https://syncer.jp/how-to-use-geolocation-api
緯度経度を住所に変換
https://www.nanchatte.com/map/getAddressByLatLng.html
https://sites.google.com/site/gmapsapi3/Home/services#ReverseGeocoding
https://qiita.com/Arashi/items/33a605870d39aeac9a37

###ロード画面
画面読込中のグルグルまわるローディング画像を出す。jQuery・javascript
http://mori-coding.blog.jp/archives/6760786.html
jQueryでできる簡易ローディング画面の実装方法
https://kigiroku.com/frontend/loder.html
(非同期での要素の読み込みを待ってからロード画像を消すために以下)
jQueryのDeferred基本編
https://h5y1m141.github.io/step-up-javascript/doc/understanding_javascript/async_07.html

###ルーティングエラー
Railsで404/500エラーの処理
https://qiita.com/zeppekipanda/items/fb1ea251197003deec12