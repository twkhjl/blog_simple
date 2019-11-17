class ArticlesController < ApplicationController

  def index
    @articles=Article.all
  end

  def new
    @article=Article.new
  end

  def create

    @article=Article.new(article_params)
    if @article.save
      redirect_to articles_path,notice:"new post successfully added"
    else
      render "new"
    end
  end

  def show
    @article=Article.find_by(id: params[:id])
  end

  def edit
    @article=Article.find_by(id: params[:id])
  end

  def update
    @article=Article.find_by(id: params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article),notice:"post modified"
    else
      render "edit"
    end

  
  end

  def destroy
    @article=Article.find_by(id: params[:id])
    @article.destroy
    redirect_to articles_path,notice:"post deleted"
  end

  private
  def article_params
    params.require(:article).permit(:title,:text)
  end

end
