class LearnsController < ApplicationController
    def index
        session[:status] = "new"
        flash[:mess] = "選択肢の紫バーをつかむとボックスを移動できます"
    end

    def test
        
        if params[:difc].present? && session[:status] == "new"
            session[:status] = "stay_c"
            session[:q_arr_index] = nil
            session[:ext_q] = nil
            session[:difc] = params[:difc]
            session[:kind] = params[:kind]
            session[:total] = params[:total].to_i
        end
        
        learn_arr = open("#{Rails.root}/app/views/learns/learn.yml", "r") { |f| YAML.load(f) } 

        #カスタムとマッチする問題を抽出する
        if session[:kind] == "nothing"  
            learn_arr = custom_q(learn_arr,"difc",session[:difc]) #種類を指定しない場合は難易度のみマッチする問題を抽出
        else
            learn_arr = custom_q(custom_q(learn_arr,"difc",session[:difc]),"kind",session[:kind]) #種類と難易度がマッチする問題を抽出
        end

        if params[:status].present? #問題の進捗状況を制御する処理(ブラウザを更新されても内容が変わらないようにする)
            if (session[:status] != "stay_s" && session[:status] != "stay_c") || ( session[:status] == "stay_s" && params[:status] == "change" ) || ( session[:status] == "stay_c" && params[:status] == "next" ) 
                session[:status] = params[:status]
            end
        end

        if session[:status] != "finish"                                                                                                 #「 session[:status]の追跡 」 

            if session[:q_arr_index].nil?                                                                                               #  開始時　・・・ new → stay_c                                               
                session[:number] = 0                                                                                                    #　  　↓
                session[:q_arr_index] = select_q(learn_arr.length-1,session[:total])                                                    #  原因から解決 ・・・ next ①
                session[:r_ans] = nil                                                                                                   #　  　↓
                session[:q_order] = nil                                                                                                 #（解決選択 ・・・ stay_s）②
                session[:check] = nil                                                                                                   #  　　↓
            end                                                                                                                         #  次の問題 ・・・ change
    
            @key = ""                                                                                                                   #　  　↓
            if session[:status] == "next" || session[:status] == "change"                                                               # (原因選択 ・・・ stay_c) ①に戻る

                if session[:status] == "next"                                                                                            
                    @key = "s_a"                                                                                                        #  ②から終了時 ・・・ finish
                    session[:status] = "stay_s"
                else 
                    @key = "c_a"
                    session[:status] = "stay_c"
                    session[:number] += 1
                end
                
                session[:r_ans] = nil
                session[:q_order] = nil
                session[:check] = nil

            elsif session[:status] == "stay_s"
                @key = "s_a"
            else
                @key = "c_a"
            end

            if session[:r_ans].nil?
                session[:r_ans], session[:q_order] = shuffle_q #問題の選択肢をシャッフルする
            end

            if params[:ans].present? #回答が送られたら答え合わせ
                session[:check] = check(session[:r_ans],params[:ans])

                if session[:number] + 1 == session[:total] && session[:status] == "stay_s"
                    session[:status] = "finish" #全ての問題が終了したら進捗状況をfinishにする
                end

            end
        
        else
            @key = "s_a" 
        end

        q = learn_arr[session[:q_arr_index][session[:number]]] #問題を抽出する
        @q = order_q(q,session[:q_order],"#{@key}") #抽出した問題を並べ替えてインスタンスとする

    end

    def custom_q(learn_arr,key,val) #カスタム通りの問題を作成するメソッド

        new_learn_arr = []
        
        for i in 0..(learn_arr.length-1)
            if learn_arr[i]["#{key}"] == val
                new_learn_arr.push(learn_arr[i])
            end
        end
        
        return new_learn_arr

    end

    def select_q(q_total, total) #問題をランダムに選ぶための添え字を作成するメソッド

        q_arr_index = [-1]

        for i in 0..(total-1)

            flg = false
            r = 0

            while flg == false
                r = rand(0..q_total)
                flg = true

                for j in 0..(q_arr_index.length-1)
                    if r == q_arr_index[j]
                        flg = false
                        break
                    end
                end
            end

            q_arr_index[i] = r

        end

        return q_arr_index

    end

    def shuffle_q #選択肢の配列の添え字をシャッフルするメソッド

        r_ans = 1 #問題の答えが格納されている場所を記憶する（各問題の答えは選択肢の1つ目に格納されている）
        q_order = [0,1,2,3] 

        3.times do #3回シャッフル

            i = rand(0..3)
            j = rand(0..3)
            while i == j
                j = rand(0..3)
            end

            tmp = q_order[i]
            q_order[i] = q_order[j]
            q_order[j] = tmp

        end

        for i in 0..3
            if q_order[i] == 0
                r_ans = i + 1 #0が格納されている=元々1つ目=答え（1を足して●●番目に合わせる）
                break
            end
        end

        return r_ans, q_order
    end

    def order_q(q,order,key) #シャッフルした順番通りに選択肢を並べ替えるメソッド

        tmp_q = []

        for i in 0..3
            tmp_q.push(q["#{key}"][order[i]])
        end

        for i in 0..3
            q["#{key}"][i] = tmp_q[i]
        end

        return q
    end

    def check(r_ans,ans) #答え合わせをするメソッド

        check = "mistake"
        if r_ans == 1 && ans == "a" || r_ans == 2 && ans == "b" || r_ans == 3 && ans == "c" || r_ans == 4 && ans == "d" 
            check = "correct" #r_ans=正解の場所が格納してある(abcd=1234) ans=送られてきた答え
        end

        return check
    end

end
