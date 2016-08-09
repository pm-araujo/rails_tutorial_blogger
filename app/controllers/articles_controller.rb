class ArticlesController < ApplicationController
	include ArticlesHelper
    before_filter :require_login, except: [:index, :show]
	before_action :get_most_popular, only: [:show]
	
	def get_most_popular
		@most_popular_articles = Article.order( view_count: :desc).first(3)
	end

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article.id

		Article.increment_counter(:view_count, @article.id)

		@article.save	
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(articles_params)
		@article.save
		flash.notice = "Article '#{@article.title}' created!"
		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash.notice = "Article '#{@article.title}'deleted!"
		redirect_to articles_path
	end

	def edit
		@article =  Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(articles_params)
		flash.notice = "Article '#{@article.title}' updated!"
		redirect_to article_path(@article)
	end
end