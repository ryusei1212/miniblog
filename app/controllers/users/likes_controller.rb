class Users::LikesController < Users::ApplicationController

  def create
    Like.create!(user_id: params[:user_id], post_id: params[:post_id])
    redirect_to root_path
  end

  def destroy
    like_post = current_user.likes.find_by(post_id: params[:post_id])
    like_post.destroy!
    redirect_to root_path
  end
end
