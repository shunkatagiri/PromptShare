# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :set_user, only: [:profile, :edit, :update]

  # User registration
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) # user_paramsはprivateメソッド
    if @user.save
      session[:user_id] = @user.id # ログインする
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = '登録に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end


  def profile
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "プロフィール情報が更新されました"
      redirect_to user_profile_path(@user)
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
