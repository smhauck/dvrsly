class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :posts

  validates :username, presence: true, uniqueness: true
  # FIXME: validates :username, exclusion: { message: "DUH", in: ->(user) { user.prohibited_usernames } }

  
  def prohibited_usernames
    # FIXME: need to pull values from database table
    %w(car bike)
  end

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
