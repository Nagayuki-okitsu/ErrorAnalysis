class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy ]


    def new
      @user = User.new
    end

    def show  
      @now_user_show = "true"
      @question = Question.where(user_id: @current_user.id)
      @answer = Answer.where(user_id: @current_user.id) 
      @group = @current_user.groups
      answer_array = []
      @answer.each do |answer|
        answer_array.push(answer.id)
      end

      @nice = 0

      if DeleteNice.where(delete_answer_include_nice: current_user.id).present?
        @nice += DeleteNice.where(delete_answer_include_nice: current_user.id).length
      end

      if Nice.where(answer_id: answer_array).present?
        @nice += Nice.where(answer_id: answer_array).length
      end

    end

    def create
        @user = User.new(user_params)
          if @user.save
            log_in @user
            flash[:signup_mess] = "登録しました。このページはマイページボタン（このページを離れると出現）から閲覧できます。"
            redirect_to user_path(@user)
          else
            render :new
          end
    end


    private
   
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by(id: @current_user.id)
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
