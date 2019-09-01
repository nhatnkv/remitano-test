class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :youtube_video_id
      t.integer :sharer_id
      t.integer :upvote
      t.integer :downvote

      t.timestamps
    end
  end
end
