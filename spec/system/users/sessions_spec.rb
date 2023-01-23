require 'rails_helper'

RSpec.describe 'ユーザー認証機能', type: :system do
  before do
    create(:user, name: 'mike', password: 'password')
  end

  it 'ユーザーはログイン、ログアウトできる' do
    visit new_user_session_path
    fill_in '名前', with: 'mike'
    fill_in 'パスワード', with: 'password'
    click_on 'ログイン'

    expect(page).to have_current_path root_path
    expect(page).to have_content 'ログインしました。'

    click_on 'dropdown-menu-link'
    click_on 'ログアウト'

    expect(page).to have_current_path new_user_session_path
  end
end
