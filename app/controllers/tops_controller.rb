class TopsController < ApplicationController
  # skip_before_action :require_login, only: [:index]

  def index
    @categories = Category.all
  end
end
