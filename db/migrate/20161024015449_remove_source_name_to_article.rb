class RemoveSourceNameToArticle < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :source_name
  end
end
