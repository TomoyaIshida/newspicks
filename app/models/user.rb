class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :image, ImagesUploader

  has_many :articles, through: :picks
  has_many :picks

  has_many :articles, through: :reads
  has_many :reads

  validates :name, presence: true

  #フォロー機能
  has_many :active_relationships,class_name:  "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :following
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  def follow(other_user)
    active_relationships.create(following_id: other_user.id)
  end

  def unfollow(other_user)
    active_relationships.find_by(following_id: other_user.id).destroy
  end

  def following?(other_user)
    active_relationships.find_by(following_id: other_user.id)
  end

end
