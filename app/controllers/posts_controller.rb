class PostsController < ApplicationController

  def index
    @post = Post.all
  end

  def show
    @post = Post.set_post
  end


    def new
      @post = Post.new
    end

    def create
      @post = Post.new
      @post.body = params[:post][:body]
      @post.title = params[:post][:title]
      @post.save
    end

    def editing
      @post = set_post
    end

    def  updated
      @post = Post.find(params[:id],post_params)
    end

    def destroy
      @post = set_post
      @post.destroy
    end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body, :title)
  end

end
