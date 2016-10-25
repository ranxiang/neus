class WelcomeController < ApplicationController
  def index
    @articles = Article.order(created_at: :desc).page params[:page]
  end
  def about
  end
end
