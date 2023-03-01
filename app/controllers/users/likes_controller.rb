class Users::LikesController < Users::ApplicationController
  def index
    @liked_post = Post.find(params[:post_id])
  end

  def create
    current_user.likes.create!(post_id: params[:post_id])
    redirect_to root_path
  end

  def destroy
    liked_post = current_user.likes.find_by(post_id: params[:post_id])
    liked_post.destroy!
    redirect_to root_path
  end
end
