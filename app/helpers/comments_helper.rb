module CommentsHelper
  def allow_comment?
    user_signed_in?
  end
end
