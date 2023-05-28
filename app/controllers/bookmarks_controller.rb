class BookmarksController < ApplicationController
  before_action :set_template

  def create
    if @template.bookmarks.where(user_id: current_user.id).exists?
      flash[:notice] = '既にブックマークしています'
    else
      @template.bookmarks.create(user_id: current_user.id)
      flash[:notice] = 'ブックマークしました'
    end
    redirect_to @template
  end

  def destroy
    @bookmark = @template.bookmarks.find_by(user_id: current_user.id)
    @bookmark.destroy
    flash[:notice] = 'ブックマークを解除しました'
    redirect_to @template
  end

  private
    def set_template
      @template = Template.find(params[:template_id])
    end
end
