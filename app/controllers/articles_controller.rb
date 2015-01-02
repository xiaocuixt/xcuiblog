class ArticlesController < ApplicationController
  def show
    @articles = Article.order(id: :desc)
    @hot_articles = Article.order(view_count: :desc)
    @article = Article.find(params[:id])
    @article_categories = Article.pluck(:category)
    @article.update(view_count:  @article.view_count + 1)
  end

  def index
    @articles = Article.order(id: :desc)
    @hot_articles = Article.order(view_count: :desc)
    @article_categories = Article.pluck(:category)
  end

  def list
    @articles = Article.where(category: params[:category])
    @hot_articles = Article.order(view_count: :desc)
    @article_categories = Article.pluck(:category)
  end
end