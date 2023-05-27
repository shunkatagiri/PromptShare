class BookmarksController < ApplicationController
  before_action :set_template

  def create
    Bookmark.create(user_id: current_user.id, template_id: params[:template_id])
  end

  def destroy
    Bookmark.find_by(user_id: current_user.id, template_id: params[:template_id]).destroy
  end

  private

  def set_template
    @template = Template.find(params[:template_id])
  end
end
