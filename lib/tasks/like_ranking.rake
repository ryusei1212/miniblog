namespace :like_ranking do
  desc '毎朝7時に前日の「いいね」数ランキングが10位までの投稿がメール通知されるようにする'

  task daily_ranking_email: :environment do
    top_10_posts = Post.top_10_daily_likes
    LikeRankingMailer.daily_ranking_email(top_10_posts).deliver_now
  end
end
