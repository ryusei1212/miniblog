require 'rails_helper'

RSpec.describe 'コメント機能', type: :system do
  let(:user) { create(:user) }
  let(:post) { create(:post, user:) }

  describe 'コメント登録機能' do
    let(:post) { create(:post, content: 'こんにちは', user:) }

    it 'コメントを登録できる' do
      sign_in user
      visit post_path(post)
      expect(page).to have_css '#new_comment'

      fill_in 'comment[content]', with: 'いい投稿ですね'

      expect do
        click_on 'コメントする'
        expect(page).to have_content 'コメントしました'
      end.to change(Comment, :count).by(1)
    end
  end

  describe 'コメント削除機能' do
    let!(:comment) { create(:comment, user:, post:, content: 'おはよう') }

    it 'コメントを削除できる' do
      sign_in user
      visit post_path(post)
      expect(page).to have_content 'おはよう'
      expect(page).to have_css '.bi-trash'

      expect do
        find('.comment-destroy-link').click
        expect(page).to have_content 'コメントを削除しました'
      end.to change(Comment, :count).by(-1)
    end
  end
end
