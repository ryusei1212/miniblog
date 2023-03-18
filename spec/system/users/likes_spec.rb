require 'rails_helper'

RSpec.describe 'いいね機能', type: :system do
  let(:user) { create(:user) }

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
