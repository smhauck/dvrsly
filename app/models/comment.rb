class Comment < ApplicationRecord

  belongs_to :parent_comment, class_name: "Comment", optional: true
  belongs_to :post
  belongs_to :user

  has_many :child_comments, class_name: "Comment", foreign_key: "parent_comment_id"
  
  has_rich_text :content

end
