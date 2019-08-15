class ArticlesController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @articles = Article.includes(:user).page(params[:page]).per(3).order("created_at DESC")
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments.order("created_at DESC")
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

  def move_to_index
    redirect_to :action => "index" unless user_signed_in?
  end
end
