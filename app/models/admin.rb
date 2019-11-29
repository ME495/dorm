class Admin < ApplicationRecord
  validates :account, :password, :email, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, format: {with: VALID_EMAIL_REGEX}, allow_nil: true
  validates :account, uniqueness: true
end
