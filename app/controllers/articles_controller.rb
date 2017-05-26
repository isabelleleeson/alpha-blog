class ArticlesController < ApplicationController
	def new
		@article = Article.new
	end

	def create
		#render plain: params[:article].inspect #displays the object in JSON format
		@article = Article.new(article_params)
		if @article.save
			flash[:notice] = "Article was created :)"
			redirect_to article_path(@article)
		else
			render 'new' #or :new
		end
	end

	def show
		@article = Article.find(params[:id])
	end

	private
	def article_params
		params.require(:article).permit(:title, :description) # article is the top level key
	end
end
