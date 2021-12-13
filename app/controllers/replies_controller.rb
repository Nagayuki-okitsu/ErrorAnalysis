class RepliesController < ApplicationController
    before_action :set_rep, only: %i[ edit update destroy ]
    before_action :logged_in_user, only:[:new]

    def new 
        @reply = Reply.new
        @answer = Answer.find(params[:ans_id])
    end

    def edit
    end

    def create
        @reply = Reply.new(rep_params)
        @reply.user_id = @current_user.id
        
        if @reply.save
            redirect_to  controller: :questions, action: :show, id: Answer.find(@reply.answer_id).question_id
        else
            render :new
        end
    end

    def update
        if @reply.update(rep_params)
            redirect_to  controller: :questions, action: :show, id: Answer.find(@reply.answer_id).question_id
        else
            render :edit
        end  
    end

    def destroy
        @reply.destroy
        redirect_to  controller: :questions, action: :show, id: Answer.find(@reply.answer_id).question_id
    end

    private

    def set_rep
        @reply = Reply.find(params[:id])
        @answer = Answer.find(@reply.answer_id)
    end

    def  rep_params
        params.require(:reply).permit(:reply, :user_id, :answer_id)
    end

end
