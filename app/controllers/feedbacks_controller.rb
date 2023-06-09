# app/controllers/feedbacks_controller.rb

class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = current_user.feedbacks.build(feedback_params)
    if @feedback.save
      redirect_to root_path, notice: 'フィードバックを送信しました。ありがとうございます！'
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:content, :details)
  end
end
