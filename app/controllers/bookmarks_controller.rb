class BookmarksController < ApplicationController
  before_action :require_login, only: [:create]
  #ページネーションを実装するために追加
  def index
    @bookmarks = current_user.bookmarks.includes(:template).page(params[:page])
  end

  def create
    @template = Template.find(params[:template_id])
    @bookmark = current_user.bookmarks.build(template: @template)
    if @bookmark.save
      redirect_to template_path(@template), notice: 'ブックマークしました'
    else
      redirect_to template_path(@template), alert: 'ブックマークに失敗しました'
    end
  end

  def destroy
    @template = Template.find(params[:template_id])
    @bookmark = current_user.bookmarks.find_by(template_id: @template.id)
    @bookmark.destroy
    redirect_to template_path(@template), notice: 'ブックマークを解除しました'
  end

  private

  def require_login
    unless logged_in?  # logged_in?はユーザーがログインしているかどうかを判定するメソッド
      flash[:error] = "ログインが必要です"
      redirect_to login_path  # ログイン画面にリダイレクト
    end
  end
end
