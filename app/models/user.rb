class User < ApplicationRecord
  has_secure_password
  has_many :notes, dependent: :destroy
  validates :email, presence: true, uniqueness: true
end
