class TemplatesController < ApplicationController
  before_action :require_login, only: [:create]

  def index
    if params[:category_id]
      @category = Category.find(params[:category_id])
      @templates = @category.templates
    else
      @templates = Template.all
    end
  end

  def new
    @template = Template.new
  end

  def show
    @template = Template.find(params[:id])
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
    params.require(:template).permit(:title, :description, :category_id,:content, :usage_example)
  end

  def require_login
    unless logged_in?  # logged_in?はユーザーがログインしているかどうかを判定するメソッド
      flash[:error] = "ログインが必要です"
      redirect_to login_path  # ログイン画面にリダイレクト
    end
  end

end
