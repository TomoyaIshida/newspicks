class Article < ApplicationRecord
  has_many :users, through: :picks
  has_many :picks
end
