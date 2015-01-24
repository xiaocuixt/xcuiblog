class ArticlesController < ApplicationController
  before_action :sort_article, only: [:index,:show, :list]
  def show
    @articles = Article.order(id: :desc)
    @article = Article.find(params[:id])
    @article.update(view_count:  @article.view_count + 1)
  end

  def index
    @articles = Article.order(id: :desc).paginate(page: params[:page], per_page: 20)
  end

  def list
    @articles = Article.where(category: params[:category])
  end
  private
  def sort_article
    @hot_articles = Article.order(view_count: :desc)
    @article_categories = Article.pluck(:category)
  end
end