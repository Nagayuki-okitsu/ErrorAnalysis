class GroupsController < ApplicationController
    before_action :logged_in_user, only:[:new,:create, :edit, :update, :destroy]

    def new
        @group = Group.new
        @group.group_users.build
    end

    def show
        @group = Group.find(params[:id])  
    end

    def create
        @group = Group.new(group_params)

        if @group.save
            flash[:group_mes] = "「#{@group.name}」というグループを作成・参加しました"
            redirect_to user_path(@current_user)
        else
            render :new
        end
    end

    def destroy
        @group.destroy

        redirect_to user_path(@current_user)
    end

    private

    def group_params
        params.require(:group).permit(:name, group_users_attributes:[:id, :user_id, :group_id])
    end

end
