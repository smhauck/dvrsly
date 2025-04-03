class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :blogs
  has_many :posts
  has_many :comments
  has_rich_text :content

  validates :username, presence: true, uniqueness: true
  validates :username, exclusion: { message: "Prohibited username", in: ->(user) { user.prohibited_usernames } }

  def prohibited_usernames
    # FIXME: need to pull values from database table
    %w(car bike)
  end

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
