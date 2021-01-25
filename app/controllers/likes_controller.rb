class LikesController < ApplicationController

  before_action :please_log_in
  before_action :check_if_owner, only: :destroy

  def create
    @like = @current_user.likes.build(like_params)
    if @like.save
      redirect_to @like.parent
    else
      redirect_to @like.parent, alert: "Something went wrong..."
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @parent = @like.parent
    @like.destroy
    redirect_to @parent
  end

  private

  def like_params
    params.require(:like).permit(:likeable_type, :likeable_id)
  end

  def check_if_owner
    unless @like.user == current_user
      redirect_to @like.parent, alert: "You do not have permission to do that"
    end
  end

end
