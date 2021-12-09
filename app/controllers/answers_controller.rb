class AnswersController < ApplicationController
  before_action :set_answer, only: %i[ show edit update destroy ]
  before_action :logged_in_user, only:[:new,:create, :edit, :update, :destroy]

  # GET /answers or /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1 or /answers/1.json
  def show
    @question = Question.find(@answer.question_id)
  end

  # GET /answers/new
  def new
    @answer = Answer.new
    @question = Question.find(params[:q_id])
  end

  # GET /answers/1/edit
  def edit
    @question = Question.find(@answer.question_id)
    @answer.user_id = @current_user.id
  end

  # POST /answers or /answers.json
  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = @current_user.id
    
      if @answer.save
        redirect_to  controller: :questions, action: :show, id: @answer.question_id
      else
        render :new
      end
  end

  # PATCH/PUT /answers/1 or /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: "Answer was successfully updated." }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
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

    # Only allow a list of trusted parameters through.
    def answer_params
      params.require(:answer).permit(:answer, :question_id)
    end
end
