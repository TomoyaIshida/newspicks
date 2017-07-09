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
end
