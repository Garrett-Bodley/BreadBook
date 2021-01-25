class PostsController < ApplicationController
  before_action :please_log_in, except: [:show, :index, :most_discussed]
  before_action :set_post, except: [:new, :create, :index]
  before_action :check_if_owner, only: [:edit, :update, :destroy]

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
    @text = "Forum"
  end

  def user_posts
    @posts = Post.where(user_id: current_user.id).order(created_at: :desc).page(params[:page]).per(30)
    @text = "Your Posts"
    render :index
  end

  def most_discussed
    @posts = Post.most_discussed
    @text = "Most Discussed Posts"
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

  def check_if_owner
    unless @post.user == current_user
      redirect_to @post, alert: "You do not have permission to do that"
    end
  end

end
