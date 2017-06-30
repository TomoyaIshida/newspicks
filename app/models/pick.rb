class Pick < ApplicationRecord
  belongs_to :article
  belongs_to :user
  has_many :comments
end
