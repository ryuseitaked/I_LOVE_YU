class Article < ApplicationRecord

  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  attachment :image

  #検索機能（都道府県）
  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

  with_options presence: true do
    validates :title
    validates :postal_code
    validates :prefecture_code
    validates :city
    validates :street
    validates :telephone_number
    validates :url
  end

  # ユーザーが「いいね」を押しているかどうかを判別する
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # 'address'にまとめ
  def address
    self.prefecture_code + self.city + self.street + self.other_address
  end

  # カラムのデータをaddressという変数にまとめる
  def address
    [self.prefecture_code,self.city,self.street].compact.join()
  end
  # addressを登録した際にgeocoderが緯度、経度のカラムにも自動的に値を入れてくれる
  geocoded_by :address
  after_validation :geocode

  #レビューの平均（starマーク）
  def avg_score
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end

  #レビューの平均点
  def review_score_percentage
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f*100/5
    else
      0.0
    end
  end

end
