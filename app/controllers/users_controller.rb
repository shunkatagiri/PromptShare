class UsersController < ApplicationController
  # User registration
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # If user registration is successful, redirect to the login page
    if @user.save
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to root_path
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password ,:password_confirmation)
  end

end
