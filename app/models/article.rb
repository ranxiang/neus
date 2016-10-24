class Article < ApplicationRecord
  has_many :comments
  has_many :votes
  has_many :users, :through => :votes

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
