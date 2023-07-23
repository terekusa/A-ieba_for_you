# == Schema Information
#
# Table name: users
#
#  id                                  :bigint           not null, primary key
#  access_count_to_reset_password_page :integer          default(0)
#  avater                              :string
#  crypted_password                    :string
#  email                               :string           not null
#  name                                :string           not null
#  reset_password_email_sent_at        :datetime
#  reset_password_token                :string
#  reset_password_token_expires_at     :datetime
#  role                                :integer
#  salt                                :string
#  created_at                          :datetime         not null
#  updated_at                          :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token)
#
require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'validation' do
    it '名前、メール、パスワードがあれば有効な状態であること' do
      user = create(:user)
      expect(user).to be_valid
    end

    it '名前がなければ無効な状態であること' do
      user = build(:user, name: '')
      user.valid?
      expect(user.errors[:name]).to include('を入力してください')
    end

    it '名前が31字以上では無効であること' do
      user = build(:user, name: ('a' * 31).to_s)
      user.valid?
      expect(user.errors[:name]).to include('は30文字以内で入力してください')
    end

    it 'メールアドレスがなければ無効な状態であること' do
      user = build(:user, email: '')
      user.valid?
      expect(user.errors[:email]).to include('を入力してください')
    end

    it 'パスワードが2文字では無効な状態であること' do
      user = build(:user, password: 'fo')
      user.valid?
      expect(user.errors[:password]).to include('は3文字以上で入力してください')
    end

    it 'パスワードが3文字あれば有効な状態であること' do
      user = build(:user, password: 'foo')
      user.valid?
      expect(user.errors[:password]).not_to include('iは3文字以上で入力してください')
    end

    it '重複するメールアドレスは無効であること' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('はすでに存在します')
    end
  end
end
