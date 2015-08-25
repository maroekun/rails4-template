# ToDo List

- [ ] 要らないgem削除
- [ ] spec 設定
- [ ] bootstrap layout
- [x] gemの選定 Take.1
- [ ] gemの選定 Take.2
- [x] 用途をコメント入れる
- [x] `README.rdoc` の削除 `README.md` の作成
- [x] `turbolinks` 無効化(プロンプトで分岐)
- [x] `bundle install`
- [x] `application.config`の変更
  - helper 生成いらない
- [x] `bootstrap-*`の設定

## bundle installあとで

- [x] `erb -> haml` 変換
- [x] `kaminari:config` 実行
- [x] `wheneverize` 実行
- [x] `bullet`の設定
- [x] `g annotate:install`
- [x] `g rspec:install`

## gemリスト

### 悩んでるgem

* 認証系
  * `devise` `devise_ldap_authenticatable`
  * 必須なわけではないけどよく使われる
* API
  * `grape`
  * API作るなら必要
* 設定系
  * `rails_config` `settings_logic` `global`
  * 好きに選べばいい
* 画像アップロード
  * `CarrierWave` `paperclip` `fog`
  * S3使うなら fog は便利
* JobWorker系
  * `resque` `sidekiq`
  * 一応入れたけど微妙
  * Rails4.2から `ActiveJob` もあるので検討
