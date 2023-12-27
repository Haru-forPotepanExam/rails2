class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  attr_accessor :remove_avatar
  has_many :rooms
  has_many :reservations, dependent: :destroy
  attr_accessor :current_password

  validates :name, presence: true
  validates :email, presence: true
end
