FactoryBot.define do
  factory :movie do
    association :user, factory: :user
    youtube_video_id { %w(NQ7PTxETsyQ ZQZ5NQuHOCc 8EejPoYbLY4 xY8qG3awjvM).sample }
  end
end