class Brain < ApplicationRecord
  CATEGORIES = ['Gourmet', 'Music dealer', 'Nerd', 'Geek', 'Netflix junky', 'Jargon master', 'OK Google', 'Sarcasm leader', 'Brain teaser', 'Rabbit hole guide']

  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings, dependent: :destroy
  validates :name, :description, :price, presence: true, uniqueness: true
  validates :category, inclusion: { in: CATEGORIES }
end
