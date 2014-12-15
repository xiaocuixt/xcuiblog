module Admin
  class ArticlesController < Admin::ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :category_list, only: [:new, :create, ]
    def index
      @articles = Article.all
    end
    def new
      @article = Article.new
    end
    def create
      @article = Article.new(article_params)
      if @article.save
        redirect_to [:admin, @article]
      else
        render 'new'
      end
    end
    def show
    end
    def edit
    end
    def update
      if @article.update(article_params)
        redirect_to [:admin, @article]
      else
        render 'edit'
      end
    end
    def destroy
      @article.destroy
      redirect_to admin_articles_url
    end

    private
    def article_params
      params.require(:article).permit(:title, :content, :summary, :image, :author, :tags, :category, :view_count)
    end

    def set_article
      @article = Article.find(params[:id])
    end

    def category_list
      @category_list = ['技术分享', '生活碎碎念','旅游纪念', '学习笔记']
    end
  end
end