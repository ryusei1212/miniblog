require 'rails_helper'

RSpec.describe 'フォロー機能', type: :system do
  let(:alice) { create(:user) }
  let(:bob) { create(:user) }

  it 'フォローとフォロー解除ができる' do
    sign_in alice
    visit user_path(bob)

    expect do
      click_on 'フォロー'
    end.to change(Relationship, :count).by(1)

    visit user_path(bob)

    expect do
      click_on 'フォロー解除'
    end.to change(Relationship, :count).by(-1)
  end
end
