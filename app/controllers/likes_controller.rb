class LikesController < ApplicationController

  def create
    @pick = Pick.find(params[:pick_id])
    @like = current_user.likes.new(pick_id: @pick.id)
    @like.save
    redirect_to article_path(params[:article_id])
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    redirect_to article_path(params[:article_id])
  end

  private
  def redirect_params
    params.require(:like).permit(:article_id)
  end
end
