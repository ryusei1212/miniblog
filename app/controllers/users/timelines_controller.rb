class Users::TimelinesController < Users::ApplicationController
  def index
    @timelines = Post.order(created_at: :desc)
    @post = current_user.posts.build
  end
end
