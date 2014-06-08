class ArticlesController < ApplicationController
def new
	@article = Article.new
end

http_basic_authenticate_with name: "nik", password: "sethi", except: [:index, :show]

def index
	if params[:tag]
		@articles = Article.tagged_with(params[:tag])
	else
		@articles = Article.all
	end
end

def create
	@article = Article.new(article_params)

	if @article.save
		redirect_to @article
	else
		render 'new'
	end
end

def show
		@article = Article.find(params[:id])
end

def edit
	@article = Article.find(params[:id])
end

def update
	@article = Article.find(params[:id])

	if @article.update(article_params)
		redirect_to @article
	else
		render 'edit'
	end
end

def destroy
  @article = Article.find(params[:id])
  @article.destroy
 
  redirect_to articles_path
end


private
	def article_params
		params.require(:article).permit(:title, :text, :tag_list)
end

end
