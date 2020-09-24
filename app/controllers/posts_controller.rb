class PostsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @post = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    if Post.create(post_params)
      redirect_to root_path
     else
       render :new
     end
  end

  private
  def post_params
    params.require(:post).permit(:name, :image, :text).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end
  
end