require 'rails_helper'

RSpec.describe '投稿内容のCRUD機能', type: :system do
  let(:user) { create(:user) }

  describe '文章の投稿機能' do
    context '空文字じゃない時' do
      it '文章を投稿できる' do
        sign_in user
        visit posts_path
        fill_in 'post[content]', with: 'おはようございます'
        click_button '投稿する'

        expect(page).to have_current_path posts_path
        expect(page).to have_content 'おはようございます'
        expect(page).to have_content '投稿に成功しました'
      end
    end

    context '空文字の時' do
      it '文章を投稿できない', js: true do
        sign_in user
        visit posts_path
        expect(page).to have_css '.disabled'
      end
    end
  end
end
