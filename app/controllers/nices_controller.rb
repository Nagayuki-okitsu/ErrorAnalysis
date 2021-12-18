class NicesController < ApplicationController
    def create
        @answer = Answer.find(params[:answer])
        current_user.nice(@answer)
    end

    def destroy
        @answer = Nice.find(params[:id]).answer
        current_user.not_nice(@answer)
    end
end
