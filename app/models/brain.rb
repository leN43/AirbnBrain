class Brain < ApplicationRecord
  has_many :users, through: :bookings, dependent: :destroy
  validates :name, :description, :price, presence: true, uniqueness: true
end
