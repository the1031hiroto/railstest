class LoginController < ApplicationController
   #skip_before_action :check_logined
  def index
    @title = 'login'
  end

  def auth
    usr = User.find_by(id: params[:user_id])
    if usr && usr.authenticate(params[:password]) then
      reset_session
      #session[:usr] = usr.id
      redirect_to params[:referer]

      cookies[:user_id] = { value: params[:user_id],
        expires: 3.months.from_now, http_only: true }
    else
      flash.now[:referer] = params[:referer]
      @error = 'ユーザ名／パスワードが間違っています。'
      render 'index'
    end
  end

  def logout
    reset_session
    redirect_to '/'
  end
end
