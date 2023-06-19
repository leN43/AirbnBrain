class Booking < ApplicationRecord
  belongs_to :brain
  belongs_to :user
  validates :brain_id, uniqueness: { scope: :user_id, message: "brain is already in your offer list !" }
end
