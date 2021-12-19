class SessionsController < ApplicationController

  def new 
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:user_mes] = "ログインしました"
      redirect_to user_path(user)
    else
      flash[:log_mes] = "メールアドレスまたはパスワードが間違っています"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
