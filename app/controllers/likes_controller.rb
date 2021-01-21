class LikesController < ApplicationController

  def create
    @like = @current_user.likes.build(like_params)

    if @like.save
      redirect_to @like.likeable.commentable
    else
      redirect_to @like.likeable.commentable, alert: "Something went wrong..."
    end
  end

  private

  def like_params
    params.require(:like).permit(:likeable_type, :likeable_id)
  end

end