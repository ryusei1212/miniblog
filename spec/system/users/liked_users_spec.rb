require 'rails_helper'

RSpec.describe 'いいねしたユーザー覧', type: :system do
  describe 'いいね一覧画面' do
    let(:alice) { create(:user, name: 'alice') }
    let(:bob) { create(:user, name: 'bob') }

    it '投稿にいいねしたユーザーの一覧が表示される' do
      alices_post = create(:post, content: 'おはよう', user: alice)
      create(:like, user: alice, post: alices_post)
      create(:like, user: bob, post: alices_post)

      sign_in alice
      visit post_path(alices_post)
      expect(page).to have_content 'おはよう'
      expect(page).to have_content '2件のいいね'

      click_on '2件のいいね'
      expect(page).to have_current_path(post_liked_users_path(alices_post))
      expect(page).to have_content 'alice'
      expect(page).to have_content 'bob'
    end
  end
end
