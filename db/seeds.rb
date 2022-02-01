# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#---yml移行前のseed
=begin
ErrorList.create({ id: 1,err_mess: "ActionView::MissingTemplate", cause: "指定のビューファイルがありません。", advice: " ビューファイルの名前を間違えていないか確認してみましょう。\n また部分テンプレートのビューファイル名の先頭には「 _ 」を付ける必要があります。"})
ErrorList.create({ id: 2,err_mess: "ActiveRecord::PendingMigrationError", cause: "実行していないマイグレーションファイルがあります。", advice: " ターミナルで「rails db:migrate」を実行しましょう。"})
ErrorList.create({ id: 3,err_mess: "ArgumentError", cause: "「引数」が不適切です。", advice: "　引数とはメソッドに渡す値のことです。\n\n　　例1）\n　　 update(a) ←updateというメソッドに変数aを渡す。このとき変数aが引数。\n\n　　例2）\n　　　　　 def sum(a,b)・・・メソッド作成\n　　　　　　 puts a + b\n　　　　　 end\n　　\n　　　　　 sum(x,y)・・・メソッド呼び出し\n\n\n　　例2のsumメソッドは引数を2つ取るように作成しているため、呼び出し時は「sum(引数１,引数２)」というように2つの引数を与えますが、「sum(x)」や「sum(x,y,z)」のように引数の数が定義に反しているとエラーになります。"})
ErrorList.create({ id: 4,err_mess: "end-of-input", cause: "「end」が不足しています。", advice: "　 if や loop 文などの「end」を必要とするプログラムを一つ一つ確認してみましょう。\n　このエラーを防ぐためにも普段から先に「end」を書いてしまうことやインデントすることを心掛けましょう。\n　※インデント・・・空白を使い内側と外側の処理をわけて見やすくすること。\n　　例)\n　　　if a==1\n　　　　　a = 2 * 3 ← 内側を字下げ\n　　　end"})
ErrorList.create({ id: 5,err_mess: "exception", cause: "例外エラーです。", advice: "構文に問題はありませんが実行中の値によってはエラーになってしまうものです。\n　どの値でエラーになるのかを調べて例外が発生しないように処理を工夫しましょう。"})
ErrorList.create({ id: 6,err_mess: "IndexError", cause: "添え字が配列の要素のないところを指定しています。", advice: "　添え字(Index)・・・配列の要素を特定するための部屋番号\n\n　次の例で添え字が不適切な場合を見てみましょう。\n　例）\n　　arr = [5,-3,10]\n\n　　arr[0] → 5\n　　arr[1] → -3\n　　arr[2] → 10\n　　arr[3] → 存在しないためエラー\n\n　添え字が0から始まることに注意しましょう。\n　配列の最後の要素の添え字は「要素数 - 1」です。"})
ErrorList.create({ id: 7,err_mess: "invalid preprocessing directive", cause: "無効な命令が存在します。", advice: "エラー文に記載されている該当箇所を確認しましょう。"})
ErrorList.create({ id: 8,err_mess: "LoadError", cause: "ファイル名もしくはパスを間違えています。", advice: "　実行しようとしているファイルの名前を間違えていないか確認してみましょう。\n また読み込もうとしているファイル・フォルダの名前、パスを間違えていないか確認してみましょう。\n \n　パス・・・ファイルやフォルダが存在する場所。\n　パスを指定する際、ファイルがフォルダーの中にある場合は「バックスラッシュ（キーボードの”ろ”）」を使って階層を下げましょう。\n　例）\n　　image＼apple(imageフォルダのappleというファイル）"})
ErrorList.create({ id: 9,err_mess: "NameError", cause: "変数や配列の名前が間違っています。", advice: " エラー文の中にどのように間違っているか、どこで間違えているかが記載されています。\n 該当する箇所を確認してみましょう。\n　　例）\n　　　エラー文に「 Did you mean?  applo 」のような記載がある確率が高いため探してみましょう。\n　（この例ではappleをapploにしてしまっているということがわかります）"})
ErrorList.create({ id: 10,err_mess: "No such file or directory", cause: "ファイル名・フォルダ名を間違えています。", advice: "　ファイル・フォルダの名前、パスを間違えていないか確認してみましょう。\n　パス・・・ファイルやフォルダが存在する場所。\n　パスを指定する際、ファイルがフォルダーの中にある場合は「バックスラッシュ（キーボードの”ろ”）」を使って階層を下げましょう。\n　例)\n　　image＼apple(imageフォルダのappleというファイル）"})
ErrorList.create({ id: 11,err_mess: "NoMethodError", cause: "存在しないメソッドを呼び出そうとしています。", advice: "　メソッドの名前を間違えている場合があります。\n　例）\n　　put a・・・putではなくputs\n　　※自作した関数についても関数名を間違えていないか確認しましょう。\n\n　Ruby on Railsの場合インスタンス変数に値が格納されていない場合があります。controllerを確認して正しく値を格納できているかチェックしましょう。"})
ErrorList.create({ id: 12,err_mess: "redeclaration of", cause: "同じ変数を2回以上宣言しています。", advice: "同じスコープ内に同じ名前の変数を宣言することはできません。"})
ErrorList.create({ id: 13,err_mess: "Routing Error", cause: "ルーティングが不適切です。", advice: "　config/routes.rbでルーティングを確認・設定しましょう。\n 「rails routes」というコマンドをターミナルで実行するとルーティングを確認できます。"})
ErrorList.create({ id: 14,err_mess: "String too long", cause: "文字列が255文字を超えています。", advice: "string型に格納できる最大文字数は255文字です。"})
ErrorList.create({ id: 15,err_mess: "syntax error", cause: "構文が正しくありません。", advice: "　エラー文の中に不適切な構文となっている箇所や原因が記載されていることが多いため確認してみましょう。\nまたこのエラーと合わせてNameErrorなど他のエラーが出ている場合はそちらを参考にしましょう。\n\n※プログラム中に全角の空白が入っている可能性があります。コードエディタ（プログラムを打ち込んでいる場所）でキーボードの「Ctrl」と「F」を同時に押すと検索ボックスが出てきます。検索ボックスに全角の空白を入力して探してみましょう。（この検索ボックスコマンドはWindowsPCであればほぼ全ての場面で使用できます。(Googleで文を探したり...etc)"})
ErrorList.create({ id: 16,err_mess: "too few arguments to function", cause: "関数に与えている引数が多すぎます。", advice: "関数を呼び出している箇所を見て定義通りに引数が渡されているか確認しましょう。"})
ErrorList.create({ id: 17,err_mess: "TypeError", cause: "型が不適切です。", advice: "　違う型の比較や計算はできません。\n　例1.1）\n　　if 1 >= ”あ”・・・「1」が「あ」より大きい?\n　例1.2)\n　　a = 1 + ”あ”・・・数字と文字は計算できない。\n\n\n　また引数に本来期待する型とは違う型の値が渡されている可能性もあります。\n　　（引数・・・update(a) ←updateというメソッドに変数aを渡す。このとき変数aが引数。）\n　例）\n　　a = 5\n　　b = ”あ”\n\n　　sum(a,b)・・・sumというメソッドを呼び出す。(引数1 + 引数2という処理を行うと定義)\n\nメソッドsumに型の違う変数が渡されてしまった。5 + ”あ” はできないためエラー。"})
ErrorList.create({ id: 18,err_mess: "undeclared", cause: "宣言されていない変数が使用されています。", advice: "該当の変数を宣言しましょう。"})
ErrorList.create({ id: 19,err_mess: "undefined reference to", cause: "定義されていない関数が使用されています。", advice: "ヘッダファイルをincludeしていない、または関数名を間違えている場合があります。"})
ErrorList.create({ id: 20,err_mess: "warning", cause: "条件式部分で「 = 」が使用されています。", advice: "　条件式で「等しい」を表す場合は「 == 」と書きます。\n　「 = 」は代入を表します。"})
ErrorList.create({ id: 21,err_mess: "ZeroDivisionError", cause: "0で割り算を行っています。", advice: "コンピュータの世界では「0」で割り算を行うことができません。"})
#ErrorList.create({ err_mess: "", cause: "", advice: "　"})
=end


#(yaml移行時に参考にしたサイトURL：https://qiita.com/yukimura1227/items/ff04eb6a771ffe1ab0b8)

#---yamlにDBの内容を書き込む処理
=begin
# yamlに吐き出す対象のmodelクラス名を指定して、
target_model = ErrorList
# 吐き出したい対象のリストを取得する(下記は全件取得しているが、テスト環境だけのデータが入っているような場合は適宜絞り込む)
target_records = target_model.all
write_filepath = "#{Rails.root}/db/seeds/#{target_model.to_s.tableize}.yml"
open(write_filepath,"w") do |write_file|
  write_file.puts target_records.to_yaml
end
=end

#---yamlのデータをDBに反映させる処理
=begin
Dir.glob("#{Rails.root}/db/seeds/*.yml").each do |yaml_filename|
    # yamlのファイル名から、対応するモデルクラスを特定し、クラスをロードする
    # 下記行が無いと、「ArgumentError: undefined class/module」が発生する。
    target_model = File.basename(yaml_filename,".yml").classify.constantize
    # すでに登録されているデータを全件削除
    target_model.delete_all

    # yamlに記述されたレコードをDBに登録する。
    File.open(yaml_filename) do |load_target_yaml|
        records = YAML.load(load_target_yaml)

        records.each do |record|
        target_model.create(record.attributes)
        end
    end
  end
=end










