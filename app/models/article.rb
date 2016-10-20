class Article < ApplicationRecord
  has_many :votes
  has_many :users, :through => :votes

  def voted_by_user?(user)
    votes.where(user: user, deleted: false).exists?
  end
end
