class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :pick, optional: true
end
