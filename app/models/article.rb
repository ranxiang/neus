class Article < ApplicationRecord
  belongs_to :creator, :class_name => "User", foreign_key: "user_id"

  has_many :comments
  has_many :votes
  has_many :voted_users, :class_name => "User", :through => :votes

  validates :title, length: { in: 1..100 }
  validates :source_url, :url => true

  def voted_by_user?(user)
    votes.where(user: user, deleted: false).exists?
  end

  def source_name
    URI.parse(source_url).host.sub(/^www./,'')
  end

  def source_host_url
    uri = URI.parse(source_url)
    uri.scheme + "://" + uri.host
  end
end
