class BookmarksController < ApplicationController
  before_action :set_template
  before_action :set_bookmark, only: :destroy

  def create
    @bookmark = @template.bookmarks.new(user_id: current_user.id)
    if @bookmark.save
      respond_to do |format|
        format.html do
          flash[:notice] = 'ブックマークしました'
          redirect_to @template
        end
        format.turbo_stream { render turbo_stream: turbo_stream.replace(dom_id(@template, :bookmark), partial: 'bookmarks/unbookmark', locals: { bookmark: @bookmark }) }
      end
    else
      flash[:notice] = '既にブックマークしています'
      redirect_to @template
    end
  end

  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.html do
        flash[:notice] = 'ブックマークを解除しました'
        redirect_to @template
      end
      format.turbo_stream { render turbo_stream: turbo_stream.replace(dom_id(@template, :bookmark), partial: 'bookmarks/bookmark', locals: { template: @template }) }
    end
  end

  private
    def set_template
      @template = Template.find(params[:template_id])
    end

    def set_bookmark
      @bookmark = @template.bookmarks.find_by(user_id: current_user.id)
    end
end
