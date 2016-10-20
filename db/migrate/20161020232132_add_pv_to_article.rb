class AddPvToArticle < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :pv, :integer, default: 0, null: false
  end
end
