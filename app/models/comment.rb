class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  has_many :child_comments, class_name: "Comment", foreign_key: "parent_comment_id"
  belongs_to :parent_comment, class_name: "Comment", optional: true

end
