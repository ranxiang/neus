class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :source_url
      t.string :source_name
      t.text :summary

      t.timestamps
    end
  end
end
