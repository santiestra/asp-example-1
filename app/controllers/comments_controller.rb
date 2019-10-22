# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.date = DateTime.now

    if @comment.save
      CommentNotificationMailer.with(comment: @comment).send_notification.deliver_later
      redirect_to post_path(@comment.post)
    else
      redirect_to post_path(@comment.post)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
