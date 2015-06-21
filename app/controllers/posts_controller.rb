class PostsController < ApplicationController

  def index
    @posts = Post.order(:created_at).reverse_order.page(params[:page]).per(10)
    @new_post = Post.new
  end

  def create
    @new_post = Post.new(post_params)
    if @new_post.save
      redirect_to '/', notice: 'Successfully posted!'
    else
      @posts = Post.order(:created_at).reverse_order.page(current_page).per(10)
      render 'index'
    end
  end

  private
    def post_params
      params.require(:post).permit(:name, :email, :comment)
    end

    def current_page
      params.require(:post).permit(:page)[:page]
    end

end
