json.extract! article, :id, :title, :source_url, :source_name, :source_host_url, :summary, :created_at, :updated_at
json.url article_url(article, format: :json)
