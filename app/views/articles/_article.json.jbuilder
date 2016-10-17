json.extract! article, :id, :title, :source_url, :source_name, :summary, :created_at, :updated_at
json.url article_url(article, format: :json)