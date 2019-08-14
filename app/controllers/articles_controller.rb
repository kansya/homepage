class ArticlesController < ApplicationController
  def index
    @articles = Article.includes(:user).order("created_at DESC")
  end

  def new
    @article = Article.new
  end

  def create
    #binding.pry
    Article.create(create_params)
    redirect_to articles_path
  end

  private
  def create_params
    params.require(:article).permit(:title, :category, :state, :article).merge(user_id: current_user.id)
  end
end
