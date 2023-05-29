class LikesController < ApplicationController
  before_action :require_login, only: [:create, :destroy]
  
  def create
    @like = current_user.likes.create(template_id: params[:template_id])
    redirect_to templates_path
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, template_id: params[:template_id])
    @like.destroy
    redirect_to templates_path
  end
end
