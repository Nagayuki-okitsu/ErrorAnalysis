class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :current_user

    private
    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        flash[:log_mes] = "この機能を使用するにはログインが必要です。\nアカウントをお持ちでない場合は新規登録ボタンからアカウントを作成してください。"
        redirect_to login_url
      end
    end

    # 質問箱機能でアップロードされている画像を表示する際に使用する（各画像の名前とパスをハッシュにしたものを枚数分配列に格納して渡す）
    def set_image
      image_list = []
      if @question.image.present?
        image_list.push({"name" => @question.file_name[0,@question.file_name.index('.')], "path" => show_image_question_path(@question)})
      end
      if @question.image_2.present?
        image_list.push({"name" => @question.file_name_2[0,@question.file_name_2.index('.')], "path" => show_image_2_question_path(@question)})
      end
      if @question.image_3.present?
        image_list.push({"name" => @question.file_name_3[0,@question.file_name_3.index('.')], "path" => show_image_3_question_path(@question)})
      end
      if @question.image_4.present?
        image_list.push({"name" => @question.file_name_4[0,@question.file_name_4.index('.')], "path" => show_image_4_question_path(@question)})
      end
      if @question.image_5.present?
        image_list.push({"name" => @question.file_name_5[0,@question.file_name_5.index('.')], "path" => show_image_5_question_path(@question)})
      end
      @image_list = image_list
    end

end
