class Users::TimelinesController < Users::ApplicationController
  def index
    # 自分の投稿と自分がフォローしている投稿を表示
    @timelines = Post.where(user_id: current_user.id).or(Post.where(user_id: current_user.following_ids)).default_order
    @post = current_user.posts.build
  end
end
