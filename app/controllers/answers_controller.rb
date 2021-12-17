class AnswersController < ApplicationController
  before_action :set_answer, only: %i[ show edit update destroy ]
  before_action :set_question, only: %i[ show edit ]
  before_action :set_current_user_ans, only: %i[ edit create ]
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
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers or /answers.json
  def create
    @answer = Answer.new(answer_params)
    
      if @answer.save
        redirect_to  controller: :questions, action: :show, id: @answer.question_id
      else
        @question = Question.find(@answer.question_id)
        render :new
      end
  end

  # PATCH/PUT /answers/1 or /answers/1.json
  def update
    if @answer.update(answer_params)
      redirect_to  controller: :questions, action: :show, id: @answer.question_id
    else
      render :edit
    end
  end

  # DELETE /answers/1 or /answers/1.json
  def destroy
    @answer.destroy
    redirect_to user_path(@current_user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    def set_question
      @question = Question.find(@answer.question_id)
    end

    def set_current_user_ans
      @answer.user_id = @current_user.id
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:answer, :question_id)
    end
end
