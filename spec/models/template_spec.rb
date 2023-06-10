require 'rails_helper'

RSpec.describe Template, type: :model do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:template) { create(:template, user: user, category: category) }

  describe 'model relations' do
    it 'has many bookmarks' do
      expect(template).to have_many(:bookmarks).dependent(:destroy)
    end

    it 'has many bookmarking users' do
      expect(template).to have_many(:bookmarking_users)
    end

    it 'has many likes' do
      expect(template).to have_many(:likes).dependent(:destroy)
    end

    it 'has many liking users' do
      expect(template).to have_many(:liking_users)
    end

    it 'belongs to user' do
      expect(template).to belong_to(:user)
    end

    it 'belongs to category' do
      expect(template).to belong_to(:category)
    end
  end

  describe '#bookmarked_by?' do
    context 'when bookmarked by the user' do
      before { create(:bookmark, user: user, template: template) }

      it 'returns true' do
        expect(template.bookmarked_by?(user)).to be_truthy
      end
    end

    context 'when not bookmarked by the user' do
      it 'returns false' do
        expect(template.bookmarked_by?(user)).to be_falsey
      end
    end
  end

  describe '#liked_by?' do
    context 'when liked by the user' do
      before { create(:like, user: user, template: template) }

      it 'returns true' do
        expect(template.liked_by?(user)).to be_truthy
      end
    end

    context 'when not liked by the user' do
      it 'returns false' do
        expect(template.liked_by?(user)).to be_falsey
      end
    end
  end

  describe '#extract_link_from_usage_example' do
    context 'when usage example includes link' do
      let(:template) do
        create(:template, user: user, category: category, usage_example: 'https://chat.openai.com/share/abcde')
      end

      it 'extracts link' do
        expect(template.link).to eq 'https://chat.openai.com/share/abcde'
      end
    end

    context 'when usage example does not include link' do
      let(:template) do
        create(:template, user: user, category: category, usage_example: 'no link here')
      end

      it 'leaves link as nil' do
        expect(template.link).to be_nil
      end
    end
  end
end
