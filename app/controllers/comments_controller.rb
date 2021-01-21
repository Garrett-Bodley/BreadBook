class CommentsController < ApplicationController

  def create
    @comment = @current_user.comments.build(comment_params)
    if @comment.save
      redirect_to @comment.commentable
    else
      redirect_to @comment.commentable, alert: "Something went wrong..."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type)
  end

end
