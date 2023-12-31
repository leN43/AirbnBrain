class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :brains
  # has_many :brains, through: :bookings
  has_many :bookings
  validates :first_name, :last_name, :email, presence: true
end
