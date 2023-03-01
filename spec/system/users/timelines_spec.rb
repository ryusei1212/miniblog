require 'rails_helper'

RSpec.describe 'current_userのタイムライン', type: :system do
  let(:alice) { create(:user) }
  let!(:alices_post) { create(:post, content: 'aliceの投稿です。', user: alice) }

  let(:mike) { create(:user) }
  let!(:mikes_post) { create(:post, content: 'mikeの投稿です。', user: mike) }

  it 'タイムラインには自分の投稿と自分がフォローしているユーザー投稿のみ表示される' do
    sign_in alice
    visit timelines_path

    expect(page).to have_content 'aliceの投稿です。'

    visit user_path(mike)
    click_on 'フォロー'
    visit timelines_path

    expect(page).to have_content 'aliceの投稿です。'
    expect(page).to have_content 'mikeの投稿です。'
  end
end
