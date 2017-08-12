class PicksController < ApplicationController

  def new
    @pick = Pick.new
    @article = Article.find(article_params)
  end

  def create
    if @pick = Pick.where(user_id: current_user.id, article_id: params[:article_id]).first_or_initialize
       @pick.update_attributes(text: params[:pick][:text])
       redirect_to root_path
    else
      @pick = current_user.picks.new(pick_params)
      if @pick.save
        redirect_to root_path
      else
        redirect_to new_article_pick_path(@article.id)
      end
    end
  end

  def destroy
    pick = Pick.find(params[:id])
    if pick.user_id == current_user.id
      pick.destroy
      redirect_to user_path(current_user.id)
    end
  end

  private
  def article_params
    params.require(:article_id)
  end

  def pick_params
    params.require(:pick).permit(:text).merge(article_id: params[:article_id])
  end

end
