class Users::TimelinesController < Users::ApplicationController
  def index
    # 自分の投稿と自分がフォローしている投稿を表示
    @timelines = Post.where(user_id: [current_user.id, *current_user.following_ids]).with_attached_image.preload(:user).default_order.page(params[:page])
    @post = current_user.posts.build
  end
end
