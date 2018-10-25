class Like < ApplicationRecord
    belongs_to :books, counter_cache: :likes_count
    belongs_to :users, class_name: 'User'
end
