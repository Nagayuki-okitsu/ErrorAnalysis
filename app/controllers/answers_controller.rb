class AnswersController < ApplicationController
  before_action :set_answer, only: %i[ show edit update destroy ]
  before_action :logged_in_user, only: %i[ new create edit update destroy]

  # GET /answers or /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1 or /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
    @question = Question.find(params[:q_id])
    set_image
  end

  # GET /answers/1/edit
  def edit
    @answer.user_id = @current_user.id
  end

  # POST /answers or /answers.json
  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = @current_user.id
    
      if @answer.save
        flash[:q_mes] = "回答を送信しました"
        redirect_to question_path(Question.find(@answer.question_id))
      else
        @question = Question.find(@answer.question_id)
        set_image
        render :new
      end
  end

  # PATCH/PUT /answers/1 or /answers/1.json
  def update
    if @answer.update(answer_params)
      flash[:q_mes] = "回答を編集しました"
      redirect_to question_path(Question.find(@answer.question_id))
    else
      render :edit
    end
  end

  # DELETE /answers/1 or /answers/1.json
  def destroy
    #削除する回答に対するいいねは残しておく
    Nice.where(answer_id: @answer.id).length.times do 
      @delete_nice = DeleteNice.new
      @delete_nice.delete_answer_include_nice = @answer.user_id
      @delete_nice.save
    end

    @answer.destroy
    flash[:q_mes] = "回答を削除しました"
    redirect_to question_path(Question.find(@answer.question_id))
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
      @question = Question.find(@answer.question_id)
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:answer, :question_id)
    end
end
