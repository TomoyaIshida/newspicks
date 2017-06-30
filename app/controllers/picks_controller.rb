class PicksController < ApplicationController

  def new
    @pick = Pick.new
    @pick.comments.build
    @article = Article.find(article_params)
    # @pick = current_user.pick.new(article)
    @articles = current_user.articles.order("updated_at DESC")
    # @articles = article.picks.order("updated_at DESC")
  end

  def create
    @pick = Pick.new(pick_params)
    @pick.save
    redirect_to root_path
  end

  private
  def article_params
    params.require(:article_id)
  end
  def pick_params
    params.require(:pick).permit(comments_attributes: [:body])
  end
end
