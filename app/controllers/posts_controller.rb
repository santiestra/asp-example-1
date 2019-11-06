# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = PostsService.index(current_user)
  end

  def show
    @post = PostsService.show(current_user, post_id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = PostsService.create(
      current_user,
      post_params[:title],
      post_params[:content]
    )

    p @post
    unless @post.blank? || @post[:errors].present?
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(post_id)
    load_categories
  end

  def update
    @post = Post.find(post_id)

    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  private

  def post_id
    params.require(:id)
  end

  def post_params
    params.permit(:title, :content, :category_id)
  end

  def load_categories
    @categories ||= Rails.cache.fetch('posts-categories', expires_in: 12.hours) do
      Category.all
    end
  end
end
