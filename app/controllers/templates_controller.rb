class TemplatesController < ApplicationController
  before_action :require_login, only: [:create]

  def new
    @template = Template.new
  end
  
  def create
    @template = current_user.templates.build(template_params)
    if @template.save
      redirect_to root_path, notice: 'テンプレートが正常に投稿されました'
    else
      render :new
    end
  end
  
  private
  
  def template_params
    params.require(:template).permit(:title, :description, :category)
  end

  def require_login
    unless logged_in?  # logged_in?はユーザーがログインしているかどうかを判定するメソッド
      flash[:error] = "ログインが必要です"
      redirect_to login_path  # ログイン画面にリダイレクト
    end
  end

end
