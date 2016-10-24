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

  def youtube_video?
    source_name == 'youtube.com'
  end

  def youtube_embed_url
    source_url.sub("watch?v=", "v/") + '?autoplay=1'
  end
end
