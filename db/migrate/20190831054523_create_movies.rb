class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :url
      t.integer :sharer_id
      t.integer :upvote
      t.integer :downvote

      t.timestamps
    end
  end
end
