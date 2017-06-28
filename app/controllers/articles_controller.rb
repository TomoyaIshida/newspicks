class ArticlesController < ApplicationController
  def index
  end

  def create
    @url = params[:content]
    render nothing: true
  end
end

