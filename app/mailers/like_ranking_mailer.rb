class LikeRankingMailer < ApplicationMailer

  def daily_ranking_email(top_10_posts)
    @top_10_posts = top_10_posts
    mail(to: 'miniblog@example.com', subject: '前日のいいねランキング', bcc: User.pluck(:email))
  end
end
