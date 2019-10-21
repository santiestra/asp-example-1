# frozen_string_literal: true

class CommentNotificationMailer < ApplicationMailer
  attr_reader :comment, :post, :user

  def send_notification
    @comment = params[:comment]
    @post = comment.post
    @user = post.user
    mail(to: user.email, subject: 'Someone commented your post')
  end
end
