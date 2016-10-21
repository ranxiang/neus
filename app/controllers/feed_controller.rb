class FeedController < ApplicationController
  layout false
  def rss
    @articles = Article.order(created_at: :desc).limit(50)
  end
end
