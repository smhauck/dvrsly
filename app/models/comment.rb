class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user


  has_many :subcomments, class_name: "Comment", foreign_key: "supcomment_id"
  belongs_to :supcomment, class_name: "Comment", optional: true




end
