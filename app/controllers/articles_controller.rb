class ArticlesController < ApplicationController

  def index
    @articles = Article.all.order("updated_at DESC").page(params[:page]).per(18)
  end

  def create
    if  @article = Article.find_by('url LIKE(?)', "%#{params[:content]}%")
      if @article.url == params[:content]
        respond_to do |format|
          format.json
        end
      end
    else
      @article = Article.new(article_params)
      if @article.save
        respond_to do |format|
          format.json
        end
      else
        render :index
      end
    end
  end

  def show
    @articles = Article.find(params[:id])
    @pick = Pick.new
    @read = Read.new
    @like = Like.new
  end

  def destroy
    article = Article.find(params[:id])
    @articles = article.picks
    if @articles.ids.blank?
      article.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
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
