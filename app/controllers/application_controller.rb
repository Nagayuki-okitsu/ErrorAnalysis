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
end
