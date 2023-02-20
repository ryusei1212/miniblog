require 'rails_helper'

RSpec.describe '投稿内容のCRUD機能', type: :system do
  let(:user) { create(:user) }

  describe '各ユーザーの投稿一覧' do
    let(:alice) { create(:user) }

    context '自分の投稿一覧画面にいるとき' do
      it '投稿の一覧と編集ボタンが表示される' do
        sign_in alice
        post1 = create(:post, content: '最初の投稿', user: alice)
        post2 = create(:post, content: '二つ目の投稿', user: alice)

        visit user_posts_path(alice)

        expect(page).to have_content '最初の投稿'
        expect(page).to have_link '🖋', href: edit_user_post_path(alice, post1)

        expect(page).to have_content '二つ目の投稿'
        expect(page).to have_link '🖋', href: edit_user_post_path(alice, post2)
      end
    end

    context '他のユーザーの投稿一覧画面にいるとき' do
      let(:other_user) { create(:user) }
      let!(:other_user_post1) { create(:post, content: 'おはようございます。', user: other_user)  }
      let!(:other_user_post2) { create(:post, content: 'こんにちは', user: other_user)  }

      it '投稿一覧は表示されるが編集ボタンは表示されない' do
        sign_in alice
        visit user_posts_path(other_user)

        expect(page).to have_content 'おはようございます。'
        expect(page).to_not have_link '🖋', href: edit_user_post_path(other_user, other_user_post1)

        expect(page).to have_content 'こんにちは'
        expect(page).to_not have_link '🖋', href: edit_user_post_path(other_user, other_user_post2)
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
