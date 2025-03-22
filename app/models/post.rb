class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  belongs_to :user
  belongs_to :diversion, optional: true
  belongs_to :blog, optional: true
  has_many :comments
end
