require 'rails_helper'

RSpec.describe CommentMailer, type: :mailer do
  let(:user) { create(:user, email: 'user@example.com') }
  let(:post) { create(:post, user: user) }

  let(:alice) { create(:user, name: 'alice') }
  let(:alices_comment) { create(:comment, post: post, user: alice, content: 'とてもいい内容ですね') }

  describe 'notify_comment' do
    let(:mail) { CommentMailer.with(post: post, comment: alices_comment).notify_comment }

    it '正しい件名で送信すること' do
      expect(mail.subject).to eq('aliceさんからのコメント')
    end

    it '正しい宛先へ送信すること' do
      expect(mail.to).to eq(['user@example.com'])
    end

    it 'デフォルト用のメールから送信すること' do
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'メール本文にコメントをしたユーザーの名前が表示されること' do
      expect(mail).to have_body_text('aliceさんからコメントが来ました。')
    end

    it 'メール本文にコメント内容が表示されること' do
      expect(mail).to have_body_text('とてもいい内容ですね')
    end
  end
end
