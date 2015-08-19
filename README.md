# Railsプロジェクト雛形@たたき台

とりあえず最低限のことをする子を作る

## How2Use

```
rails new sample -m [path/to/template]
# or
rails new sample -m [http://path/to/template]
```

ローカルに落としてきても、URL指定でもおk

`mysql`を使うときは

    rails new -d mysql # で指定すること

### ToDo

- [ ] gemの選定(`Gemfile`に追記される)
- [ ] 用途をコメント入れる
- [x] `README.rdoc` の削除 `README.md` の作成
- [x] `turbolinks` 無効化(プロンプトで分岐)
- [x] `bundle install`

##### after_bundle内で

- [x] `erb -> haml` 変換

### memo

* `bootstrap` etc.. 追加
    * 初期化コマンドも`after_bundle`内でしたほうがよさげ
