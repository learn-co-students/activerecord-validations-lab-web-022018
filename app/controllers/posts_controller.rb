class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.find(params[:id])
    if @post.valid?
      redirect_to post_path
    else
      flash[:error] = @post.erros.full_messages
      redirect_to new_post_path(@post)
    end
  end

  private

  def post_params
    params.require(:post).requre(:title, :content, :summary, :category)
  end
end
