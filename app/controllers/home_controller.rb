class HomeController < ApplicationController
  def index
    @articles = Article
             .paginate(page: params[:page], per_page: 10)
             .order(id: :desc)
    @hot_articles = Article.order(view_count: :desc)
    @article_categories = Article.pluck(:category).uniq
  end
end