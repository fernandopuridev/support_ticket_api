class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable,
         :recoverable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  enum :role, { user: 0, admin: 1 }

  has_many :tickets
  has_many :messages

  validates :name, presence: true
end