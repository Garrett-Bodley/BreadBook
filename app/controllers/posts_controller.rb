class PostsController < ApplicationController
  before_action :set_post, except: [:new, :create, :index]

  def new
    @post = @current_user.posts.build
  end

  def create
    @post = @current_user.posts.build(post_params)
    if @post.save
      redirect_to @post
    else
      redirect_to new_post_path, alert: "Something went wrong..."
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_post
    @post = Post.find(params[:id]) if params[:id]
  end

  def post_params
    params.require(:post).permit(:title, :content, :bake_id)
  end

end
