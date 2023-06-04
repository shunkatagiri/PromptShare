# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :set_search

  private

  def set_search
    @q = Template.ransack(params[:q])
  end
end
