#railsのバージョンを確認する
$ rails -v
$ Rails 5.1.6.1

#rubyのバージョンを確認する
$ ruby -v
$ ruby 2.3.1p112 (2016-04-26 revision 54768) [x86_64-darwin17]

#bundlerのバージョンを確認する
$ bundler -v
$ Bundler version 1.17.1

# 新規作成
$ rails _5.2.1_ new project_name -d mysql

# gem導入
$ bundle install

# DB導入
$ rake db:create

#コントローラー作成
$ rails g controller tweets

#モデル作成
$ rails g model tweet

#routesのかくにん
$ rails routes

#マイグレーションファイルを編集
$ rake db:migrate
$ rake db:rollback
---------------------------------------------------
class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string      :name
      t.text        :text
      t.text        :image
      t.timestamps null: true
    end
  end
end
----------------------------------------------------
#コンソール起動
$ rails c
インスタンスを取得できる

#deviseの導入
Gemfile gem 'devise'
$ rails g devise:install
$ rails g devise user
$ rake db:migrate
$ rails g devise:views

#ニックネームカラムの追加
$ rails g migration AddNicknameToUsers nickname:string
$ rake db:migrate

#deviseのストロングパラメータの設定
app/controllers/application_controller
------------------------------------------------------
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end
end
------------------------------------------------------

#スクレイピングを実行する
Gemfile gem 'mechanize'

$ rails c
$ Scraping.get

#一行選択
option + command + 下
shift  + command + 左

#heroku設定

#herokuにログイン
$ heroku login

#gitのmaster変更を反映させる(デプロイ)
$ git push heroku master

#remoteにherokuのマスターブランチを追加する
$ vim .git/config

[remote "heroku"]
  url = https://git.heroku.com/APP_NAME.git
  fetch = +refs/heads/*:refs/remotes/heroku/*


#マイグレーションファイルの実行
$ heroku run rake db:migrate

#アプリ再起動
$ heroku restart --app APP_NAME

#アプリ確認
$ heroku apps
