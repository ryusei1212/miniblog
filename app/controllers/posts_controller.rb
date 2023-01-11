class PostsController < ApplicationController

  def index
    @posts = Post.order(created_at: :desc)
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
       redirect_to posts_path, notice: '投稿に成功しました。'
    else
      redirect_to posts_path, alert: '本文を入力してください'
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
