class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy show_image ]
  before_action :logged_in_user, only:[:new,:create, :edit, :update, :destroy]
  before_action :current_user, only:[:new,:create, :edit, :update, :destroy]

  # GET /questions or /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1 or /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)
    @question.user_id = @current_user.id
    if params[:question][:image].present?
      @question.image = params[:question][:image].read
      @question.image_content_type = params[:question][:image].content_type
    end

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: "Question was successfully created." }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
      respond_to do |format|
        if @question.update(question_params)
          format.html { redirect_to @question, notice: "Question was successfully updated." }
          format.json { render :show, status: :ok, location: @question }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @question.errors, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy
    Answer.where(question_id: @question.id).destroy_all
    redirect_to user_path(@current_user)
  end

  def show_image
    @question = Question.find(params[:id])
    send_data(@question.image, type: @question.image_content_type, disposition: :inline)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
      @answer = Answer.where(question_id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:title, :key, :content, :user_id)
    end

end
