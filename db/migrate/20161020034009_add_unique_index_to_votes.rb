class AddUniqueIndexToVotes < ActiveRecord::Migration[5.0]
  def change
    add_index :votes, [:user_id, :article_id], unique: true
  end
end
