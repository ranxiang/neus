class AddDeletedToVote < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :deleted, :boolean, default: false
  end
end
