class GroupUsersController < ApplicationController

    def new
        if params[:name].present?
            @group = Group.find_by(name: params[:name])

            if @group.nil?
                flash[:group_mes] = "その名前のグループは存在しません"
            elsif @current_user.groups.ids.include?(@group.id) 
                flash[:group_mes] = "あなたはすでにそのグループに参加しています"
            else
                @group_user = GroupUser.new
            end
        end
    end

    def create

        @group_user = GroupUser.new(group_user_params)

        if @group_user.save
            flash[:group_mes] = "#{Group.find(@group_user.group_id).name}に参加しました"
            redirect_to user_path(@current_user)
        end
    end

    def destroy
        GroupUser.where(user_id: @current_user.id).find_by(group_id: params[:group_id]).destroy
        flash[:group_mes] = "#{Group.find(params[:group_id]).name}から退会しました"

        redirect_to user_path(@current_user)
    end

    private

    def group_user_params
        params.require(:group_user).permit(:user_id, :group_id)
    end
    
end
