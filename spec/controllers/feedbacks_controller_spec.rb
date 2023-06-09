# spec/controllers/feedbacks_controller_spec.rb

require 'rails_helper'

RSpec.describe FeedbacksController, type: :controller do
  let(:user) { create(:user) }
  before { sign_in user }

  describe 'GET #new' do
    it 'responds successfully' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new feedback' do
        expect {
          post :create, params: { feedback: { content: 'Test feedback', details: 'Test details' } }
        }.to change(Feedback, :count).by(1)
      end

      it 'redirects to the root_path' do
        post :create, params: { feedback: { content: 'Test feedback', details: 'Test details' } }
        expect(response).to redirect_to root_path
      end
    end
  end
end
