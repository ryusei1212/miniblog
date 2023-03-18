class Users::LikedUsersController < ApplicationController
  def index
    post = Post.find(params[:post_id])
    @liked_users = post.liked_users.default_order.page(params[:page])
  end
end
