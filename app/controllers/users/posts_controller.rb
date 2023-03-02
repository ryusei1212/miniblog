class Users::PostsController < Users::ApplicationController
  before_action :set_post, only: %i[edit update destroy]

  def index
    user = User.find(params[:user_id])
    @posts = user.posts.default_order
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to timelines_path, notice: '投稿に成功しました。'
    else
      redirect_to timelines_path, alert: '本文を入力してください'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to timelines_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!
    redirect_to timelines_path, notice: '投稿を削除しました'
  end

  private

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
