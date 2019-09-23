class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def show
    @post = Post.includes(comments: :user).find(post_id)
  end

  def new
    @post = Post.new
    load_categories
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.date = DateTime.current

    if @post.save
      redirect_to posts_path
    else
      load_categories
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
    params.require(:post).permit(:title, :content, :category_id)
  end

  def load_categories
    @categories ||= Rails.cache.fetch('posts-categories', expires_in: 12.hours) do
      Category.all
    end
  end
end
