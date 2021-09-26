class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_books, through: :likes, source: :post
  attachment :profile_image, destroy: false
  validates :name, length: {maximum: 20, minimum: 2}
  validates :name, uniqueness: { message: "Name has already been taken" }
  validates :introduction, length: {maximum:50}
end