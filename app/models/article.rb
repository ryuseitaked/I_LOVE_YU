class Article < ApplicationRecord

  belongs_to :user
  has_many :reviews, dependent: :destroy
  attachment :image

  with_options presence: true do
    validates :title
    validates :address
    validates :telephone_number
    validates :url
  end

  def avg_score
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end

  def review_score_percentage
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f*100/5
    else
      0.0
    end
  end

end
