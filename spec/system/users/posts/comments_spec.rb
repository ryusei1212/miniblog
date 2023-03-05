require 'rails_helper'

RSpec.describe 'コメント機能', type: :system do
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  describe 'コメント登録機能' do
    RSpec::Matchers.define_negated_matcher :not_change, :change

    context '自分の投稿にコメントした時' do
      let(:my_post) { create(:post, content: 'こんにちは', user:) }

      it 'コメントは登録できるがメールは送信されない' do
        sign_in user
        visit post_path(my_post)
        expect(page).to have_content 'こんにちは'
        expect(page).to have_css '#new_comment'

        fill_in 'comment[content]', with: '我ながら良い出来だ'

        expect do
          click_on 'コメントする'
          expect(page).to have_content 'コメントしました'
        end.to change(Comment, :count).by(1).and not_change(ActionMailer::Base.deliveries, :count)

        expect(page).to have_content '我ながら良い出来だ'
      end
    end

    context '他人の投稿にコメントした時' do
      let(:other_user_post) { create(:post, content: 'こんばんは') }

      it 'コメントの登録と投稿したユーザーにメールが送信される' do
        sign_in user
        visit post_path(other_user_post)
        expect(page).to have_content 'こんばんは'
        expect(page).to have_css '#new_comment'

        fill_in 'comment[content]', with: 'いい投稿ですね'

        expect do
          click_on 'コメントする'
          expect(page).to have_content 'コメントしました'
        end.to change(Comment, :count).by(1).and change(ActionMailer::Base.deliveries, :count).by(1)

        expect(page).to have_content 'いい投稿ですね'
      end
    end
  end

  describe 'コメント削除機能' do
    let!(:my_comment) { create(:comment, user:, post:, content: 'おはよう') }

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
