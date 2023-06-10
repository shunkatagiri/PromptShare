require 'rails_helper'

RSpec.describe User, type: :model do
  # ユーザーを新しく作成するためのメソッド
  def build_user(attrs = {})
    described_class.new({
      name: "John Doe",
      email: "john.doe@example.com",
      password: "password",
      password_confirmation: "password",
    }.merge(attrs))
  end

  describe 'associations' do
    it 'has many bookmarks' do
      should have_many(:bookmarks)
    end

    it 'has many bookmarked_templates through bookmarks' do
      should have_many(:bookmarked_templates).through(:bookmarks)
    end

    it 'has many likes' do
      should have_many(:likes)
    end

    it 'has many liked_templates through likes' do
      should have_many(:liked_templates).through(:likes)
    end

    it 'has many templates' do
      should have_many(:templates)
    end
  end

  describe 'validations' do
    it 'requires a name to be present' do
      user = build_user(name: nil)
      expect(user.valid?).to eq(false)
    end

    it 'requires a unique email' do
      user1 = build_user
      user2 = build_user
      user1.save!
      expect(user2.valid?).to eq(false)
    end

    it 'requires a password to be present on create' do
      user = build_user(password: nil, password_confirmation: nil)
      expect(user.valid?).to eq(false)
    end

    it 'requires a password to be confirmed on create' do
      user = build_user(password_confirmation: "not_password")
      expect(user.valid?).to eq(false)
    end

    it 'requires a password to be at least 3 characters long' do
      user = build_user(password: 'ab', password_confirmation: 'ab')
      expect(user.valid?).to eq(false)
    end

    it 'validates password when crypted_password is changed' do
      existing_user = create(:user)
      existing_user.password = 'new_password'
      existing_user.password_confirmation = 'new_password'
      expect(existing_user).to be_valid
    end
  
    it 'validates password confirmation when crypted_password is changed' do
      existing_user = create(:user)
      existing_user.password = 'new_password'
      existing_user.password_confirmation = 'wrong_password'
      expect(existing_user).not_to be_valid
      expect(existing_user.errors.details[:password_confirmation]).to include({error: :confirmation, attribute: "Password"})
    end
  end
end
