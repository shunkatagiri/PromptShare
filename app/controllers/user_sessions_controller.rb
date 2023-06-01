class UserSessionsController < ApplicationController
  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_back_or_to  root_path, notice: 'Login successful.'
    else
      flash[:alert] = 'Login failed.'
      redirect_to action: 'new'
    end
  end

  def destroy
    logout
    redirect_to login_path, notice: 'Logged out!'
  end
end
