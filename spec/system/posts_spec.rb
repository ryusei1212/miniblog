require 'rails_helper'

RSpec.describe '投稿内容のCRUD機能', type: :system do
  describe '文章の投稿機能' do
    context '空文字じゃない時' do
      it '文章を投稿できる' do
        visit new_post_path
        fill_in '投稿内容', with: 'おはようございます'
        click_button '登録する'

        expect(page).to have_current_path posts_path
        expect(page).to have_content 'おはようございます'
      end
    end

    context '空文字の時' do
      it '文章を投稿できない' do
        visit new_post_path
        click_button '登録する'

        expect(page).to have_content '投稿内容を入力してください'
        expect(page).to have_current_path posts_path
      end
    end
  end
end
