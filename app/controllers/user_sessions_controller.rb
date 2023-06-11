class UserSessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:alert] = 'メールアドレスまたはパスワードが間違っています。'
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace('user_sessions_new', partial: 'user_sessions/new') }
        format.html { render :new }
      end
    end
  end

  def destroy
    logout
    redirect_to login_path, notice: 'Logged out!'
  end
end
