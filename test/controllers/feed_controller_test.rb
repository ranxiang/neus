require 'test_helper'

class FeedControllerTest < ActionDispatch::IntegrationTest
  test "should get rss" do
    get feed_rss_url
    assert_response :success
  end

end
