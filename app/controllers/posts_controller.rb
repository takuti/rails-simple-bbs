class PostsController < ApplicationController

  def index
    @posts = Post.all
    @new_post = Post.new
  end

  def create
    @new_post = Post.new(post_params)
    if @new_post.save
      redirect_to '/', notice: 'Successfully posted!'
    else
      @posts = Post.all
      render 'index'
    end
  end

  private
    def post_params
      params.require(:post).permit(:name, :email, :comment)
    end

end
