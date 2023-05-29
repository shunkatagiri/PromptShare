# app/controllers/likes_controller.rb
class LikesController < ApplicationController
  before_action :set_template

  def create
    @like = current_user.likes.build(template_id: params[:template_id])
    @like.save

    respond_to do |format|
      format.turbo_stream
    end
  end

  def destroy
    @like = Like.find_by(template_id: params[:template_id], user_id: current_user.id)
    @like.destroy

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def set_template
    @template = Template.find(params[:template_id])
  end
end
