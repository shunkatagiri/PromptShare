# app/controllers/likes_controller.rb
class LikesController < ApplicationController
  before_action :require_login, only: [:create, :destroy]

  def create
    @template = Template.find(params[:template_id])
    @like = @template.likes.build(user: current_user)
    if @like.save
      redirect_to template_path(@template), notice: 'いいねしました'
    else
      redirect_to template_path(@template), alert: 'いいねできませんでした'
    end
  end

  def destroy
    @template = Template.find(params[:template_id])
    @like = @template.likes.find_by(user: current_user)
    if @like.destroy
      redirect_to template_path(@template), notice: 'いいねを解除しました'
    else
      redirect_to template_path(@template), alert: 'いいねを解除できませんでした'
    end
  end

  private

  def require_login
    unless logged_in?  # logged_in?はユーザーがログインしているかどうかを判定するメソッド
      flash[:error] = "ログインが必要です"
      redirect_to login_path  # ログイン画面にリダイレクト
    end
  end

end
