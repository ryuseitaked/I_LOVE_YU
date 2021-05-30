class ArticlesController < ApplicationController

  #非ログインユーザーへのアクセス制限
  before_action :authenticate_user!, except: [:index,:show, :search, :rank, :favorites]

  #ワードで検索機能
  before_action :set_search

  def index
    @articles = Article.all
    @articles = Article.page(params[:page]).per(9)
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
    gon.article = @article
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

  #検索機能
  def search
    @results = @search.result
  end

  def rank
     # イイね順にランキング形式で表示する
    @all_ranks = Article.find(Favorite.group(:article_id).order('count(article_id) desc').limit(9).pluck(:article_id))
  end

  # 現在地から検索
  def map
    gon.articles = Article.all
  end

  private


  #ransackメソッド:送られてきたパラメーターを元にテーブルからデータを検索するメソッド
  #resultメソッド:ransackメソッドで取得したデータを
  #ActiveRecord_Relationのオブジェクトに変換するメソッド
  def set_search
    @search = Article.ransack(params[:q])
  end

  def article_params
    params.require(:article).permit(:title,:image,:postal_code,:prefecture_code,:city,:street,:other_address,:url,:introduction,:telephone_number)
  end

end
