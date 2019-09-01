class Movie < ApplicationRecord
  validates :youtube_video_id, presence: true
  belongs_to :user, foreign_key: :sharer_id
end
