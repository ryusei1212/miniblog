require 'rails_helper'

RSpec.describe '投稿内容のCRUD機能', type: :system do
  describe '文章の投稿機能' do
    context '空文字じゃない時' do
      it '文章を投稿できる' do
        visit posts_path
        fill_in 'post[content]', with: 'おはようございます'
        click_button '投稿する'

        expect(page).to have_current_path posts_path
        expect(page).to have_content 'おはようございます'
        expect(page).to have_content '投稿に成功しました'
      end
    end

    context '空文字の時' do
      it '文章を投稿できない' do
        visit posts_path
        click_button '投稿する'

        expect(page).to have_content '本文を入力してください'
        expect(page).to have_current_path posts_path
      end
    end
  end
end
