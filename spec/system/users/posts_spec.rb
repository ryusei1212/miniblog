require 'rails_helper'

RSpec.describe '投稿内容のCRUD機能', type: :system do
  let(:user) { create(:user) }

  describe '一覧表示' do
    context 'ユーザーAがログインしている時' do
      let(:user_a) { create(:user) }

      it 'ユーザーAの投稿した文章一覧が表示される' do
        sign_in user_a
        post1 = create(:post, content: '最初の投稿', user: user_a)
        post2 = create(:post, content: '二つ目の投稿', user: user_a)

        visit user_posts_path(user_a)

        expect(page).to have_content '最初の投稿'
        expect(page).to have_link '🖋', href: edit_user_post_path(user_a, post1)

        expect(page).to have_content '二つ目の投稿'
        expect(page).to have_link '🖋', href: edit_user_post_path(user_a, post2)
      end
    end
  end

  describe '投稿' do
    it '文章を投稿できる' do
      sign_in user
      visit user_timelines_path(user)
      fill_in 'post[content]', with: 'おはようございます'
      expect do
        click_button '投稿する'
      end.to change(Post, :count).by(1)

      expect(page).to have_current_path user_timelines_path(user)
      expect(page).to have_content 'おはようございます'
      expect(page).to have_content '投稿に成功しました'
    end
  end

  describe '更新' do
    let(:post) { create(:post, user:) }

    it '文章を更新できる' do
      sign_in user
      visit edit_user_post_path(user, post)
      fill_in 'post[content]', with: '別の文章'
      click_on '更新する'

      expect(page).to have_content '別の文章'
      expect(page).to have_current_path user_timelines_path(user)
    end
  end

  describe '削除' do
    let(:post) { create(:post, user:) }

    it '文章を削除できる', js: true do
      sign_in user
      visit edit_user_post_path(user, post)
      click_on '削除'
      expect do
        expect(page.accept_confirm).to eq '本当に削除しますか？'
        expect(page).to have_content '投稿を削除しました'
      end.to change(Post, :count).by(-1)
    end
  end
end
