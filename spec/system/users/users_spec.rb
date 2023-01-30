require 'rails_helper'

RSpec.describe 'ユーザープロフィール', type: :system do
  let(:user) { create(:user, name: 'Mike', profile: '初めまして。') }

  describe '詳細画面' do
    it 'ユーザープロフィールが表示される' do
      sign_in user
      visit user_path(user)

      expect(page).to have_content 'Mike'
      expect(page).to have_content '初めまして。'
    end
  end

  describe '更新' do
    it 'プロフィールを編集できる' do
      sign_in user
      visit edit_user_path(user)
      fill_in '名前',	with: 'Bob'
      fill_in 'プロフィール',	with: 'こんにちは。'
      click_on '更新する'

      expect(page).to have_current_path user_path(user)
      expect(page).to have_content 'Bob'
      expect(page).to have_content 'こんにちは。'
    end
  end
end
