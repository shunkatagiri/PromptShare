# app/controllers/bookmarks_controller.rb
class BookmarksController < ApplicationController
  before_action :set_template

  def create
    if Bookmark.create(user: current_user, template: @template)
      redirect_to @template, notice: 'Bookmark was successfully created.'
    else
      redirect_to @template, alert: 'Unable to create bookmark.'
    end
  end

  def destroy
    Bookmark.find_by(user: current_user, template: @template).destroy
    redirect_to @template, notice: 'Bookmark was successfully removed.'
  end

  private

  def set_template
    @template = Template.find(params[:template_id])
  end
end
