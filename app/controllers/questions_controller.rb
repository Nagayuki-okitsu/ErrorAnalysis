class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy show_image show_image_2 show_image_3]
  before_action :logged_in_user, only:[:new,:create, :edit, :update, :destroy]
  before_action :current_user, only:[:new,:create, :edit, :update, :destroy]

  # GET /questions or /questions.json
  def index

    if params[:key].present?
      session[:key] = params[:key]
    elsif params[:sort_key].nil?
      session[:key] = ""
    end

    if session[:key].present?
      @question = q_sort(params[:sort_key], Question.where(key: session[:key]))
    else
      @question = q_sort(params[:sort_key], Question.all)
    end
  end

  def q_sort(sort_key,question)
    case sort_key
    when 'old'
      question.order(:id)
    else 
      question.order(id: :DESC)
    end
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
    if params[:question][:image_2].present?
      @question.image_2 = params[:question][:image_2].read
      @question.image_content_type_2 = params[:question][:image_2].content_type
    end
    if params[:question][:image].present?
      @question.image_3 = params[:question][:image_3].read
      @question.image_content_type_3 = params[:question][:image_3].content_type
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

      if params[:question][:image].present?
      @question.image = params[:question][:image].read
      @question.image_content_type = params[:question][:image].content_type
      end
      if params[:question][:image_2].present?
        @question.image_2 = params[:question][:image_2].read
        @question.image_content_type_2 = params[:question][:image_2].content_type
      end
      if params[:question][:image].present?
        @question.image_3 = params[:question][:image_3].read
        @question.image_content_type_3 = params[:question][:image_3].content_type
      end
      
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
    this_q_ans = Answer.where(question_id: @question.id)
    this_q_ans.each do |ans|
      Reply.where(answer_id: ans.id).destroy_all
    end
    this_q_ans.destroy_all

    @question.destroy

    redirect_to user_path(@current_user)
  end

  def show_image
    @question = Question.find(params[:id])
    send_data(@question.image, type: @question.image_content_type, disposition: :inline)
  end

  def show_image_2
    @question = Question.find(params[:id])
    send_data(@question.image_2, type: @question.image_content_type_2, disposition: :inline)
  end

  def show_image_3
    @question = Question.find(params[:id])
    send_data(@question.image_3, type: @question.image_content_type_3, disposition: :inline)
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
