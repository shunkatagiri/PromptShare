class TemplatesController < ApplicationController
  def new
    @template = Template.new
  end
  
  def create
    @template = current_user.templates.build(template_params)
    if @template.save
      redirect_to @template, notice: 'テンプレートが正常に投稿されました'
    else
      render :new
    end
  end
  
  private
  
  def template_params
    params.require(:template).permit(:title, :description, :category)
  end  
end
