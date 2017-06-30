class PicksController < ApplicationController

  def new
    @articles = current_user.articles.order("updated_at DESC")
  end

end
