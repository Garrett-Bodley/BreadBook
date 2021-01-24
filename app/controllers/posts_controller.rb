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
      render :new
    end
  end

  def show
    @comment = @post.comments.build
  end

  def edit
  end

  def index
    @posts = Post.order(created_at: :desc).page(params[:page]).per(30)
  end

  def update
    @post.update(post_params)
    if @post.save
      redirect_to @post
    else
      redirect_to edit_post_path(@post), alert: "Something went wrong..."
    end
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
