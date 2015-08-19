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

## ToDo

- [x] gemの選定 Take. 1
    - いっぱいいれた
- [ ] 用途をコメント入れる
- [x] `README.rdoc` の削除 `README.md` の作成
- [x] `turbolinks` 無効化(プロンプトで分岐)
- [x] `bundle install`
- [ ] `bullet`の設定
- [ ] `kaminari`の設定
- [ ] `bootstrap-*`の設定

##### after_bundle内で

- [x] `erb -> haml` 変換
- [x] `kaminari:config` 実行

### memo

* `bootstrap` etc.. 追加
    * 初期化コマンドも`after_bundle`内でしたほうがよさげ
* `--skip-bundle`が一切効かんがなんぞ。。。
