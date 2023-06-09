# app/controllers/templates_controller.rb
class TemplatesController < ApplicationController
  before_action :require_login, only: [:create]

  def index
    @category = Category.find(params[:category_id]) if params[:category_id].present?
  
    @templates = if @category
      @category.templates
    else
      Template.all
    end
  
    case params[:order]
    when 'most_liked'
      @templates = @templates.order(likes_count: :desc)
    else
      @templates = @templates.order(created_at: :desc)
    end

    @templates = @templates.page(params[:page]).per(18)
  
    respond_to do |format|
      format.html
    end
  end

  def search
    @templates = @q.result(distinct: true).page(params[:page]).per(18)
  end
  
  def new
    @template = Template.new
  end

  def show
    @template = Template.find(params[:id])
    @bookmark = @template.bookmarks.find_by(user_id: current_user.id)
    @like = @template.likes.find_by(user: current_user)
  end

# app/controllers/templates_controller.rb

  def create
    @template = current_user.templates.build(template_params)
    if @template.save
      redirect_to template_path(@template), notice: 'テンプレートが正常に投稿されました'
    else
      render :new
    end
  end

  def edit
    @template = Template.find(params[:id])
    if @template.user != current_user
      redirect_to template_path(@template), alert: 'あなたはこのテンプレートを編集する権限がありません。'
    end
  end
  
  def update
    @template = Template.find(params[:id])
    if @template.user == current_user
      if @template.update(template_params)
        redirect_to template_path(@template), notice: 'テンプレートが正常に更新されました。'
      else
        render :edit
      end
    else
      redirect_to template_path(@template), alert: 'あなたはこのテンプレートを編集する権限がありません。'
    end
  end

  def destroy
    @template = Template.find(params[:id])
    if @template.user == current_user
      @template.destroy
      redirect_to category_templates_path(@template.category), notice: 'Template was successfully deleted.'
    else
      redirect_to category_templates_path(@template.category), alert: 'You are not authorized to delete this template.'
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
