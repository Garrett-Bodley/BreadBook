class CommentsController < ApplicationController
  before_action :set_comment, except: :create

  def create
    @comment = @current_user.comments.build(comment_params)
    if @comment.save
      redirect_to @comment.commentable
    else
      redirect_to @comment.commentable, alert: "Something went wrong..."
    end
  end

  def edit
  end

  def update
    @comment.update(comment_params)
    if @comment.valid?
      redirect_to @comment.commentable, alert: "Changes saved"
    else
      redirect_to @comment.commentable, alert: "Something went wrong..."
    end
  end

  def destroy
    @parent = @comment.commentable
    @comment.destroy
    redirect_to @parent
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type)
  end

end
