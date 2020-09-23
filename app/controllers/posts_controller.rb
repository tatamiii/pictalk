class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    if Post.create
      redirect_to root_path
     else
       render :new
     end
  end

  private
  def post_params
    params.require(:post).permit(:name, :image, :text)
  end
  
end
