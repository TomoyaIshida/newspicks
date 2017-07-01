class PicksController < ApplicationController

  def new
    @pick = Pick.new
    @pick.comments.build
    @article = Article.find(article_params)
  end

  def create
  @pick = current_user.picks.new(pick_params)
    if @pick.save
      redirect_to root_path
    else
      redirect_to new_article_pick_path(@article.id)
    end
  end

  private
  def article_params
    params.require(:article_id)
  end

  def pick_params
    params.require(:pick).permit(comments_attributes: [:body, :user_id]).merge(article_id: params[:article_id])
  end
end
