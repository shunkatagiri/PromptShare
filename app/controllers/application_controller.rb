# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  # before_action :require_login
  before_action :set_search
  

  private

  def redirect_to_landing_page_if_not_logged_in
    redirect_to login_url unless logged_in?
  end
  
  def set_search
    @q = Template.ransack(params[:q])
  end
end
