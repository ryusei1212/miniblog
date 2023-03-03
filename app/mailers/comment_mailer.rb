class CommentMailer < ApplicationMailer
  def notify_comment
    @comment = params[:comment]
    @post = params[:post]
    mail(to: @post.user.email, subject: "#{@comment.user.name}さんからのコメント")
  end
end
