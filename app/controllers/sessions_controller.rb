class SessionsController < ApplicationController

  def new 
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:log_mes] = "ログインしました"
      redirect_to root_url
    else
      render 'new'
      flash[:not_log] = "メールアドレスまたはパスワードが間違っています"
    end
  end

  def destroy
    log_out if logged_in?
    flash[:log_mes] = "ログアウトしました"
    redirect_to root_url
  end

end
