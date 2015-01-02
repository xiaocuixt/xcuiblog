class HomeController < ApplicationController
  def index
    @articles = Article.order(id: :desc)
    @hot_articles = Article.order(view_count: :desc)
    @article_categories = Article.pluck(:category)
  end
end