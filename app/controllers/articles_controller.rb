class ArticlesController < ApplicationController

  #非ログインユーザーへのアクセス制限
  before_action :authenticate_user!, except: [:index,:show]

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id  #誰が投稿するのか
    if @article.save
      redirect_to article_path(@article), notice: '投稿が追加されました'
    else
      render :new
    end
  end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
    @review = Review.new
  end

  def edit
    @article = Article.find(params[:id])
    if @article.user != current_user
      redirect_to articles_path, alert: '不正なアクセスです'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
    redirect_to article_path(@article), notice: '内容が変更されました'
    else
      render :edit
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    redirect_to user_path(article.user), notice: '投稿を削除しました'
  end

  private
  def article_params
    params.require(:article).permit(:title,:image,:address,:url,:introduction,:telephone_number)
  end

end
