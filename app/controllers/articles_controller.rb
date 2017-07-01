class ArticlesController < ApplicationController

  def index
    @articles = Article.order("updated_at DESC").limit(20)
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      # render nothing: true
      respond_to do |format|
        # format.html redirect_to root_path
        format.json
      end
    else
      render :index
    end
  end

  def show
  end

  private
  def article_params
    agent = Mechanize.new
    page = agent.get(params[:content])
    title = page.title
    content = page.at('meta[property="og:description"]')[:content]
    sitename = page.at('meta[property="og:site_name"]')[:content]
    url = page.at('meta[property="og:url"]')[:content]
    image = page.at('meta[property="og:image"]')[:content]
    params.permit.merge(title: page.title, description: content, sitename: sitename, url: url, image: image, user_id: current_user.id)
  end
end
