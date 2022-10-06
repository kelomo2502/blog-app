class Comment < ApplicationRecord
  after_save :update_comments_counter

  belongs_to :author, class_name: 'User'
  belongs_to :post

  
end
