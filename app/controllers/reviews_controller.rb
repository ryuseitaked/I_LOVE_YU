class ReviewsController < ApplicationController

  before_action :authenticate_user!, only: [:create]

  def index
    @article = Article.find(params[:article_id])
    @reviews = @article.reviews
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to article_reviews_path(@review.article)
    else
      @article = Article.find(params[:id])
      render "article/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:article_id, :score, :content)
  end

end
