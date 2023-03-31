class Users::TimelinesController < Users::ApplicationController
  def index
    # 自分の投稿と自分がフォローしている投稿を表示
    @timelines = Post.timeline(current_user).with_attached_image.preload(:user).default_order.page(params[:page])
    @post = current_user.posts.build
  end
end
