xml.instruct!
xml.rss :version => '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do

  xml.channel do
    xml.title t(:project_name)
    xml.description t(:html_head_title)
    xml.link root_url
    xml.language 'zh-CN'
    xml.tag! 'atom:link', :rel => 'self', :type => 'application/rss+xml', :href => root_url

    for article in @articles
      xml.item do
        xml.title article.title
        #xml.category post.category.name
        xml.pubDate(article.created_at.rfc2822)
        xml.link article_comments_url(article_id: article)
        xml.guid article_comments_url(article_id: article)
        xml.description(h(article.summary))
        #xml.image_url post.image_url
      end
    end

  end

end
