class UserSessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash.now[:alert] = 'メールアドレスまたはパスワードが間違っています。'
      respond_to do |format|
        format.turbo_stream { render :create, status: :unprocessable_entity}
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    logout
    redirect_to login_path, notice: 'Logged out!'
  end
end
