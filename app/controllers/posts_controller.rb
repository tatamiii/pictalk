class PostsController < ApplicationController
  def index
    @post = Post.all
  end

  def new
    @tweet = Tweet.new
  end
end
