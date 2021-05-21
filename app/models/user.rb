class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_many :articles
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy


  validates :name, presence: true

  #ログイン時に退会済みのユーザーが同じアカウントでログイン出来ないようにする。
  # true = ログインユーザーが有効な状態（退会していない）
  def active_for_authentication?
    super && (self.is_valid == true)
  end

end
