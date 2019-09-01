class CommentsController < ApplicationController
  def create
    # Por ahora como no tenemos login, hacemos que el user
    # que crea los posts sea el primero
    user = User.first
    @comment = Comment.new(comment_params)
    @comment.user = user
    @comment.date = DateTime.now

    @comment.save!

    redirect_to post_path(@comment.post)
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
