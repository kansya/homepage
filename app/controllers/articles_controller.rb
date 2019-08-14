class ArticlesController < ApplicationController
  def index
    @articles = Article.includes(:user).order("created_at DESC")
  end

  def new
    @article = Article.new
  end

  def create
    binding.pry
    Article.create(create_params)
  end

  private
  def create_params
    params.permit(:title, :category, :state, :article).merge(author: current_user.id)
  end
end
