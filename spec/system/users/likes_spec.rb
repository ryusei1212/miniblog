require 'rails_helper'

RSpec.describe 'いいね機能', type: :system do
  let(:user) { create(:user) }

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
      expect(page).to have_current_path(post_likes_path(alices_post))
      expect(page).to have_content 'alice'
      expect(page).to have_content 'bob'
    end
  end

  it '投稿に対していいね及び、いいねの解除ができる' do
    sign_in user
    create(:post, content: 'おはよう', user:)

    visit root_path

    expect(page).to have_content 'おはよう'
    expect(page).to have_css '.bi-heart'

    expect do
      find('.like-link').click
      expect(page).to have_css '.bi-heart-fill'
    end.to change(Like, :count).by 1

    visit root_path

    expect do
      find('.unlike-link').click
      expect(page).to have_css '.bi-heart'
    end.to change(Like, :count).by(-1)
  end
end
