class Brain < ApplicationRecord
  CATEGORIES = ['Négociatrice', 'Perfectionniste', 'Drama Queen', 'Macchiavélique', 'Contrepéteur', 'Urgentiste', 'Chanteur de douche', 'Poesie de la lune']

  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings, dependent: :destroy
  validates :name, :description, :price, presence: true, uniqueness: true
  validates :categories, inclusion: { in: CATEGORIES }
end
