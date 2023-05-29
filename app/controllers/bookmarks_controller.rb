class BookmarksController < ApplicationController
  include ActionView::RecordIdentifier 
  before_action :set_template
  before_action :set_bookmark, only: :destroy

  def create
    @bookmark = @template.bookmarks.new(user_id: current_user.id)
    if @bookmark.save
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(dom_id(@template, :bookmark), partial: 'bookmarks/unbookmark', locals: { bookmark: @bookmark }) }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(dom_id(@template, :bookmark), partial: 'bookmarks/bookmark', locals: { template: @template, error: '既にブックマークしています' }) }
      end
    end
  end

  def destroy
    @bookmark.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace(dom_id(@template, :bookmark), partial: 'bookmarks/bookmark', locals: { template: @template }) }
    end
  end

  private
    def set_template
      @template = Template.find(params[:template_id])
    end

    def set_bookmark
      @bookmark = @template.bookmarks.find_by(user_id: current_user.id)
      unless @bookmark
        flash[:notice] = 'ブックマークが存在しません'
        redirect_to @template
      end
    end
end
