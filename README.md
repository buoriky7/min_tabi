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

##メモ
管理者：User(3)テスト用管理者

APIキーの環境変数化）
.bash_profile ファイルにGOOGLE_MAP_APIのキーを保存済み。
vagrantリロードして使えなくなった場合は、もう一度exportするか、メンターさんに相談すること
使用するときは以下のように記述
<% ENV["GOOGLE_MAP_API_KEY"] %>