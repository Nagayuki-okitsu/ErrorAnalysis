class QuestionsController < ApplicationController
  before_action :set_question, only: %i[ show edit update destroy show_image show_image_2 show_image_3]
  before_action :logged_in_user, only: %i[ new create edit update destroy]
  before_action :current_user, only: %i[ new create edit update destroy]

  # GET /questions or /questions.json
  def index

    if  params[:key].present?
      session[:key] = params[:key]
    elsif params[:group_name].present?
      session[:group_name] = params[:group_name]
    elsif params[:sort_key].present?
      session[:sort_key] = params[:sort_key]
    else
      session[:key] = session[:group_name] = session[:sort_key] = ""
    end


    if session[:key].present? || session[:group_name].present?

      if session[:group_name].present?

        #選択されたグループと一致する中間テーブルを抽出
        group_user = GroupUser.where(group_id: Group.find_by(name: session[:group_name]).id)

        #抽出された中間テーブルに存在するuser_idを全て配列に格納する
        group_user_id = []
        group_user.each do |g_u|
          group_user_id.push(g_u.user_id)
        end

        #配列に存在するuser_idと一致する質問を全て抽出し、ソートしてインスタンス変数に格納
        @question = q_sort(params[:sort_key], Question.where(user_id: group_user_id))

        if session[:key].present?
          @question = q_sort(params[:sort_key], @question.where(key: session[:key]))
        end
       
      else
        @question = q_sort(params[:sort_key], Question.where(key: session[:key]))
      end

    else
      @question = q_sort(params[:sort_key], Question.all)
    end

  end

  def q_sort(sort_key,question)
    case sort_key
    when '古い順'
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
    @image = @question.file_name
    @image_2 = @question.file_name_2
    @image_3 = @question.file_name_3
  end

  # POST /questions or /questions.json
  def create
    @question = Question.new(question_params)
    @question.user_id = @current_user.id

    if params[:question][:image].present?
      @question.image = params[:question][:image].read
      @question.file_name = params[:question][:image].original_filename
      @question.image_content_type = params[:question][:image].content_type
    end
    if params[:question][:image_2].present?
      @question.image_2 = params[:question][:image_2].read
      @question.file_name_2 = params[:question][:image_2].original_filename
      @question.image_content_type_2 = params[:question][:image_2].content_type
    end
    if params[:question][:image_3].present?
      @question.image_3 = params[:question][:image_3].read
      @question.file_name_3 = params[:question][:image_3].original_filename
      @question.image_content_type_3 = params[:question][:image_3].content_type
    end

  
    if @question.save
      flash[:q_mes] = "質問を送信しました"
      redirect_to @question
    else
      render :new
    end
    
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update

    if params[:question][:image].present?
      @question.image = params[:question][:image].read
      @question.file_name = params[:question][:image].original_filename
      @question.image_content_type = params[:question][:image].content_type
    end
    if params[:question][:image_2].present?
      @question.image_2 = params[:question][:image_2].read
      @question.file_name_2 = params[:question][:image_2].original_filename
      @question.image_content_type_2 = params[:question][:image_2].content_type
    end
    if params[:question][:image_3].present?
      @question.image_3 = params[:question][:image_3].read
      @question.file_name_3 = params[:question][:image_3].original_filename
      @question.image_content_type_3 = params[:question][:image_3].content_type
    end
      
    
      if @question.update(question_params)
        flash[:q_mes] = "質問を編集しました"
        redirect_to @question
      else
        render :edit
      end
      
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    #削除されたいいねを表示するための処理（dependent: :destroyではなくここで直接削除する）
    Answer.where(question_id: @question.id).each do |answer|
      Nice.where(answer_id: answer.id).length.times do 
        @delete_nice = DeleteNice.new
        @delete_nice.delete_answer_include_nice = answer.user_id
        @delete_nice.save
      end
      answer.destroy
    end

    @question.destroy
    flash[:q_mes] = "質問を削除しました"
    redirect_to user_path(@current_user)
  end

  def show_image
    send_data(@question.image, type: @question.image_content_type, disposition: :inline)
  end

  def show_image_2
    send_data(@question.image_2, type: @question.image_content_type_2, disposition: :inline)
  end

  def show_image_3
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
