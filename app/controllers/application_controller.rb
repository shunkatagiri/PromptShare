# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  before_action :set_search
  

  private

  def redirect_to_landing_page_if_not_logged_in
    redirect_to root_path unless logged_in?
  end

  def set_search
    @q = Template.ransack(params[:q])
  end
end
