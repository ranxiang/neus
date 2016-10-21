class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes, options: 'ROW_FORMAT=DYNAMIC' do |t|
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
