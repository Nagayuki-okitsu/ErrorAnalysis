# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ErrorList.create({ err_mess: "syntax error", cause: "構文が正しくありません。", advice: "　エラー文の中に不適切な構文となっている箇所や原因が記載されていることが多いため確認してみましょう。\n※プログラム中に全角の空白が入っている可能性があります。Ctrl+Fで出てきた検索ボックスに全角の空白を入力して探してみましょう。"})
ErrorList.create({ err_mess: "end-of-input", cause: "「end」が不足しています。", advice: "  if や loop 文などの「end」を必要とするプログラムを一つ一つ確認してみましょう。\n（注意：プログラムが複雑である場合、エラー文中の「rb:5」などのエラーが発生している箇所を示す情報はあまりあてになりません。「end」が関係する文を全て調べましょう。） "})
ErrorList.create({ err_mess: "ArgumentError", cause: "「引数」が不適切です。", advice: "　引数とはメソッドに渡す値のことです。\n例：update(a) ←updateというメソッドに変数aを渡す。この際の変数aが引数。\n　エラーが起きているメソッドが公式で用意されているものである場合はそのメソッドに対する適切な引数を調べましょう。\n 個人で作成したメソッドである場合は、そのメソッドを定義した箇所とそのメソッドを呼び出している箇所（エラーが起きている箇所）を見比べて、引数に間違いがないか確認してみましょう。"})
ErrorList.create({ err_mess: "NameError", cause: "変数や配列の名前が間違っています。", advice: " エラー文の中にどのように間違っているか、どこで間違えているかが記載されています。\n 該当する箇所を確認してみましょう。\n例：Did you mean?  matigae_1（間違えた文字列）"})
ErrorList.create({ err_mess: "warning", cause: "条件式部分で「 = 」が使用されています。", advice: "　条件式で「等しい」を表す場合は「 == 」と書きます。\n　「 = 」は代入を表します。"})
ErrorList.create({ err_mess: "ActionView::MissingTemplate", cause: "指定のビューファイルがありません。", advice: " ビューファイルの名前を間違えていないか確認してみましょう。\n また部分テンプレートのビューファイル名の先頭には「 _ 」を付ける必要があります。"})
ErrorList.create({ err_mess: "ActiveRecord::PendingMigrationError", cause: "実行していないマイグレーションファイルがあります。", advice: " ターミナルで「rails db:migrate」を実行しましょう。"})
ErrorList.create({ err_mess: "NoMethodError", cause: "メソッドが存在していません。", advice: "　該当のメソッド（変数や配列、関数（puts等））が定義されていない、もしくはそれらに値が入っていません。\n エラーの内容に応じてメソッドを定義する or 値を代入する必要があります。\n 関数定義ミスの場合 → 公式で用意されているメソッドの名前を間違えている可能性があります。例：putsをputとしている。\n　値が入っていない場合 → 値を代入する処理がある場合、代入が上手く行われていません。なぜ代入が失敗しているのかを調べましょう。"})
ErrorList.create({ err_mess: "RoutingError", cause: "ルーティングが不適切です。", advice: "　config/routes.rbでルーティングを確認・設定しましょう。\n 「rails routes」というコマンドをターミナルで実行するとルーティングを確認できます。"})
ErrorList.create({ err_mess: "ZeroDivisionError", cause: "0で割り算を行っています。", advice: "　コンピュータの世界では「0」で割り算を行うことができません。"})
ErrorList.create({ err_mess: "LoadError", cause: "ファイル名を間違えています。", advice: "　実行しようとしているファイルの名前を間違えていないか確認してみましょう。\n またファイルがフォルダーの中にある場合は「バックスラッシュ（キーボードの”ろ”）」を使って階層を下げましょう。例：image＼apple(imageフォルダのappleというファイル）"})
ErrorList.create({ err_mess: "String too long", cause: "文字列が255文字を超えています。", advice: "string型に格納できる最大文字数は255文字です。"})
ErrorList.create({ err_mess: "undeclared", cause: "宣言されていない変数が使用されています。", advice: "　該当の変数を宣言しましょう。"})
ErrorList.create({ err_mess: "undefined reference to", cause: "定義されていない関数が使用されています。", advice: "　ヘッダファイルをincludeしていない、または関数名を間違えている場合があります。"})
ErrorList.create({ err_mess: "too few arguments to function", cause: "関数に与えている引数が足りません。", advice: "　関数を呼び出している箇所を見て定義通りに引数が渡されているか確認しましょう。"})
ErrorList.create({ err_mess: "too few arguments to function", cause: "関数に与えている引数が多すぎます。", advice: "　関数を呼び出している箇所を見て定義通りに引数が渡されているか確認しましょう。"})
ErrorList.create({ err_mess: "No such file or directory", cause: "ファイル名が間違っています。", advice: "　ファイル名が合っているか確認しましょう。"})
ErrorList.create({ err_mess: "invalid preprocessing directive", cause: "無効な命令が存在します。", advice: "　エラー文に記載されている該当箇所を確認しましょう。"})
ErrorList.create({ err_mess: "redeclaration of", cause: "同じ変数を2回以上宣言しています。", advice: "　同じスコープ内に同じ名前の変数を宣言することはできません。"})
ErrorList.create({ err_mess: "exception", cause: "例外エラーです。", advice: "　構文に問題はありませんが実行中の値によってはエラーになってしまうものです。\n　どの値でエラーになるのかを調べて例外が発生しないように処理を工夫しましょう。"})
ErrorList.create({ err_mess: "IndexError", cause: "添え字が不適切です。", advice: " 配列の添え字が要素のないところを指定しています。\n 添え字は0から始まることに注意しましょう。\n 配列の最後の要素の添え字は「要素数 - 1」です。"})
ErrorList.create({ err_mess: "TypeError", cause: "データ型が不適切な場合や引数が不適切な場合があります。", advice: "　データ型の場合 → int型の変数（数字）とstring型の変数（文字列）を比べることはできません。"})
