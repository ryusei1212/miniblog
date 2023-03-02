class Users::LikesController < Users::ApplicationController
  def index
    post = Post.find(params[:post_id])
    @liked_users = post.liked_users
  end

  def create
    current_user.likes.create!(post_id: params[:post_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    liked_post = current_user.likes.find_by(post_id: params[:post_id])
    liked_post.destroy!
    redirect_back(fallback_location: root_path)
  end
end
