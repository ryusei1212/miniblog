require 'rails_helper'

RSpec.describe User, type: :model do
  # describe 'validation' do
  #   it '適切な形式の名前だけを許可する' do
  # アルファベットのみでスペースが含まれていない(OK)
  #     user = build(:user, name: 'Mike')
  #     expect(user).to be_valid

  # スペースが含まれている(NG)
  #     user.name = 'ruby bob'
  #     expect(user).to be_invalid

  # アルファベット以外が含まれている(NG)
  #     user.name = '鈴木太郎'
  #     expect(user).to be_invalid
  #   end
  # end
end
