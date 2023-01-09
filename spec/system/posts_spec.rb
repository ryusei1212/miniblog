require 'rails_helper'

RSpec.describe '投稿内容のCRUD機能', type: :system do
  describe '文章の投稿機能' do
    let(:post) { create(:post, content: 'おはようございます') }

    context '空文字じゃない時' do
      it '文章を投稿できる' do
        pp post
      end
    end

  end


end
