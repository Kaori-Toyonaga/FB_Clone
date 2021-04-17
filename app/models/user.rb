class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 30 }, on: :create
  validates :email, presence: true, length: { maximum: 50 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, on: :create
  validates :email, uniqueness: true, on: :create
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  has_many :blogs
  has_many :favorites, dependent: :destroy
  mount_uploader :image, ImageUploader
end
