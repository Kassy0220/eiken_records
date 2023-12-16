# eiken_records

## セットアップと起動
アプリを初めて起動する際は、以下のコマンドを実行してください。

- `bundle install`
- `bin/rails db:migrate`

アプリは次のコマンドで起動します。
- `bin/rails s`

## アプリの使い方
アプリを起動後、`http://localhost:3000/`にアクセスすると、記録一覧ページが表示されます。

### 記録を作成する

`記録作成`リンクから記録作成ページに遷移し、記録を作成することができます。

[![Image from Gyazo](https://i.gyazo.com/3609ac5b5115a526c4a552602864cd71.gif)](https://gyazo.com/3609ac5b5115a526c4a552602864cd71)

### 作成した記録を確認する
`http://localhost:3000/`または`http://localhost:3000/records`にアクセスすると、作成した記録を一覧で確認することができます。

各記録をクリックすることで、記録の詳細を確認することができます。

[![Image from Gyazo](https://i.gyazo.com/394bd5085515f0e45219297c9891dbe8.gif)](https://gyazo.com/394bd5085515f0e45219297c9891dbe8)

### 記録を編集する
記録の詳細にある`編集`リンクをクリックすることで、編集ページに遷移できます。

[![Image from Gyazo](https://i.gyazo.com/1c412e5f45ee7dae384b9c2869b8e944.png)](https://gyazo.com/1c412e5f45ee7dae384b9c2869b8e944)

内容を変更し`更新`ボタンを押すと、記録を更新することができます。

[![Image from Gyazo](https://i.gyazo.com/ddc8b6d241bc65f16553e752387c0c6d.gif)](https://gyazo.com/ddc8b6d241bc65f16553e752387c0c6d)

### 記録を削除する
記録の詳細にある`削除`リンクをクリックすることで、その記録を削除することができます。

[![Image from Gyazo](https://i.gyazo.com/aaa6137dde928c06dd97dbe69cfc3230.gif)](https://gyazo.com/aaa6137dde928c06dd97dbe69cfc3230)
