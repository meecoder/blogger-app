class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    def show
        @article = Article.find(params[:id])
        @comment = Comment.new
        @comment.article_id = @article.id
    end
    def new
        @article = Article.new
    end
    def create
        @article = Article.new
        @article.title = params[:article][:title]
        @article.body = params[:article][:body]
        @article.save
        flash.notice = "Article '#{@article.title}' was created!"
        redirect_to article_path(@article)
    end
    def destroy
        Article.find(params[:id]).destroy
        flash.notice = "Article '#{@article.title}' was removed!"
        redirect_to articles_path
    end
    def edit
        @article = Article.find(params[:id])
    end
    def update
        @article = Article.find(params[:id])
        @article.update(article_params)
        flash.notice = "Article '#{@article.title}' was updated!"
        redirect_to article_path(@article)
    end
    def article_params
        params.require(:article).permit(:id, :body, :title, :tag_list, :image)
    end
end
