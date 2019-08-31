class Movie < ApplicationRecord
  validates :url, presence: true
  validates :url, format: {with: /(http(s)?:\/\/)?((w){3}.)?youtu(be|.be)?(\.com)?\/.+/}

  belongs_to :user, foreign_key: :sharer_id
end
