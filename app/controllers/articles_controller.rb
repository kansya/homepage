class ArticlesController < ApplicationController
  def index
    @articles = Article.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    #binding.pry
    Article.create(create_params)
    redirect_to articles_path
  end

  def destroy
    article = Article.find(params[:id]);
    if article.user_id == current_user.id
      article.destroy
    end
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    article = Article.find(params[:id])
    if article.user_id == current_user.id
      article.update(create_params)
    end
    redirect_to articles_path
  end

  private
  def create_params
    params.require(:article).permit(:title, :category, :state, :article).merge(user_id: current_user.id)
  end
end
