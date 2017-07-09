class Article < ApplicationRecord
  has_many :users, through: :picks
  has_many :picks

  has_many :users, through: :reads
  has_many :reads

  validates :url, presence: true
end
