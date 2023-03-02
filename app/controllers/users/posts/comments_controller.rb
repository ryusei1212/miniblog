class Users::Posts::CommentsController < Users::Posts::ApplicationController
  def create
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to post_path(@post), notice: 'コメントしました'
    else
      render 'users/posts/show', status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end
