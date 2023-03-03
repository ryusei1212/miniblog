class Users::Posts::CommentsController < Users::Posts::ApplicationController
  skip_before_action :set_post, only: :destroy

  def create
    comment = @post.comments.build(comment_params)
    comment.user = current_user
    if comment.save
      redirect_to post_path(@post), notice: 'コメントしました'
    else
      redirect_to post_path(@post), alert: 'コメントを入力してください'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    post = comment.post
    comment.destroy!
    redirect_to post_path(post), alert: 'コメントを削除しました'
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
