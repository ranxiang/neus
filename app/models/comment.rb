class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates_uniqueness_of :body, scope: [:user_id, :article_id]
  validates_length_of :body, :maximum=> 2000, :allow_blank => false
end
