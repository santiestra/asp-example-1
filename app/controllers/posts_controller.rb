class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.includes(comments: :user).find(post_id)
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    # Por ahora como no tenemos login, hacemos que el user
    # que crea los posts sea el primero
    user = User.first
    @post = Post.new(post_params)
    @post.user = user
    @post.date = DateTime.current

    if @post.save
      redirect_to posts_path
    else
      @categories = Category.all
      render 'new'
    end
  end

  def edit
    @post = Post.find(post_id)
    @categories = Category.all
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
end
