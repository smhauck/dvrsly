class Post < ApplicationRecord

  belongs_to :blog, optional: true
  belongs_to :diversion, optional: true
  belongs_to :user

  has_many :comments
  has_rich_text :content
  has_one :action_text_rich_text,
    class_name: 'ActionText::RichText',
    as: :record

  # validates :body, presence: true
  validates :title, presence: true

end
