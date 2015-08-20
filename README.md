# Railsプロジェクト雛形@たたき台

とりあえず最低限のことをする子を作る

## How2Use

```
rails new sample -m [path/to/template]
# or
rails new sample -m [http://path/to/template]
```

ローカルに落としてきても、URL指定でもおk

`mysql`使いたい、`test-unit`要らね な場合

    rails new -T -d mysql

## gemリスト

#### 悩んでるgem

* 認証系
  * `devise` `devise_ldap_authenticatable`
  * 必須なわけではないけどよく使われる
* API
  * `grape`
  * API作るなら必要
* 設定系
  * `rails_config` `settings_logic` `global`
  * 好きに選べばいい系
* 画像アップロード
  * `CarrierWave` `paperclip` `fog`
  * S3使うなら fog は便利
* JobWorker系
  * `resque` `sidekiq`
  * 一応入れたけど微妙
  * Rails4.2から `ActiveJob` もあるので検討したいところ

## ToDo

- [ ] 要らないgem削除
- [x] gemの選定 Take. 1
- [ ] gem追加 Take.2
- [x] 用途をコメント入れる
- [x] `README.rdoc` の削除 `README.md` の作成
- [x] `turbolinks` 無効化(プロンプトで分岐)
- [x] `bundle install`
- [ ] `application.config`の変更

##### bundle installあとで

- [x] `erb -> haml` 変換
- [x] `kaminari:config` 実行
- [x] `wheneverize` 実行
- [ ] `bootstrap-*`の設定
- [x] `bullet`の設定
- [ ] `g annotate:install`
- [ ] `g rspec:install`

### memo

* `bootstrap` etc.. 追加
    * 初期化コマンドも`after_bundle`内でしたほうがよさげ
* `--skip-bundle`が一切効かんがなんぞ。。。
