class LearnsController < ApplicationController
    def index
    end

    def test
        #session[:q_arr_index] = nil
        #session[:status] = ""

        if params[:difc].present? && session[:status] != "new"
            session[:status] = "new"
            session[:difc] = params[:difc]
            session[:kind] = params[:kind]
            session[:total] = params[:total].to_i
        end
        
        learn_arr = open("#{Rails.root}/app/views/learns/learn.yml", "r") { |f| YAML.load(f) } 

        if session[:kind] == "nothing"
            learn_arr = custom_q(learn_arr,"difc",session[:difc])
        else
            learn_arr = custom_q(custom_q(learn_arr,"difc",session[:difc]),"kind",session[:kind])
        end

        if params[:status].present?
            if (session[:status] != "stay_s" && session[:status] != "stay_c") || ( session[:status] == "stay_s" && params[:status] == "change" ) || ( session[:status] == "stay_c" && params[:status] == "next" ) 
                session[:status] = params[:status]
            end
        end

        if session[:status] != "finish"                                                                                                 #「 session[:status]の追跡 」 

            if session[:q_arr_index].nil?                                                                                               #  開始時　・・・ new                                                      
                session[:number] = 0                                                                                                    #　  　↓
                session[:q_arr_index] = select_q(learn_arr,session[:total])                                                             #  原因から解決 ・・・ next ①
                session[:r_ans] = nil                                                                                                   #　  　↓
                session[:q_order] = nil                                                                                                 #（解決選択 ・・・ stay_s）②
                session[:check] = nil                                                                                                   #  　　↓
            end                                                                                                                         #  次の問題 ・・・ change
    
            @key = ""                                                                                                                   #　  　↓
            if session[:status] == "next" || session[:status] == "change"                                                               # (原因選択 ・・・ stay_c) ①に戻る

                if session[:status] == "next"                                                                                           #  　　↓
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

            q = learn_arr[session[:q_arr_index][session[:number]]] #問題を抽出する

            @q = order_q(q,session[:q_order],"#{@key}") #抽出した問題を並べ替えてインスタンスとする

            if params[:ans].present?
                session[:check] = check(session[:r_ans],params[:ans])

                if session[:number] + 1 == session[:total] && session[:status] == "stay_s"
                    session[:status] = "finish"
                    tmp = session[:q_arr_index]
                    session[:tmp_q_index] = tmp[tmp.length-1]
                    session[:q_arr_index] = nil
                end
            end
        
        else
            q = learn_arr[session[:tmp_q_index][session[:number]]] #問題を抽出する
            @q = order_q(q,session[:q_order],"s_a") #抽出した問題を並べ替えてインスタンスとする
            @key = "s_a"
        end

    end

    def custom_q(learn_arr,key,val)

        new_learn_arr = []
        
        for i in 0..(learn_arr.length-1)
            if learn_arr[i]["#{key}"] == val
                new_learn_arr.push(learn_arr[i])
            end
        end
        
        return new_learn_arr

    end

    def select_q(learn_arr, total)

        q_arr_index = []
        q_arr_index.push(rand(0..(learn_arr.length-1)))

        (total-1).times do

            flg = false
            i = 0

            while flg == false
                i = rand(0..(learn_arr.length-1))

                for j in 0..(q_arr_index.length-1)
                    if i == q_arr_index[j]
                        break
                    end
                    flg = true
                end
            end

            q_arr_index.push(i)

        end

        return q_arr_index

    end

    def shuffle_q #選択肢の配列の添え字をシャッフルする

        r_ans = 1 #問題の答えが格納されている場所を記憶する（各問題の答えは選択肢の1つ目に格納されている）
        q_order = [0,1,2,3] 

        3.times do

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

    def order_q(q,order,key)

        tmp_q = []

        for i in 0..3
            tmp_q.push(q["#{key}"][order[i]])
        end

        for i in 0..3
            q["#{key}"][i] = tmp_q[i]
        end

        return q
    end

    def check(r_ans,ans)

        check = "mistake"
        if r_ans == 1 && ans == "a" || r_ans == 2 && ans == "b" || r_ans == 3 && ans == "c" || r_ans == 4 && ans == "d" 
            check = "correct"
        end

        return check
    end

end
