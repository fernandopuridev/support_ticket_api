class Ticket < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy

  enum :category, {
    reservation: 0,
    payment: 1,
    cancellation: 2,
    information: 3,
    technical: 4,
    other: 5
  }

  enum :status, {
    open: 0,
    in_progress: 1,
    closed: 2
  }

  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true
end
