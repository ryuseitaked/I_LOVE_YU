class Review < ApplicationRecord

  belongs_to :user
  belongs_to :article

  validates :score, presence: true
  
end
