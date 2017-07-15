class Pick < ApplicationRecord
  belongs_to :article
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  validates :article_id, presence: true
  validates :user_id, presence: true
end
