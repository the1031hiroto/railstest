class Like < ApplicationRecord
    belongs_to :book, counter_cache: :likes_count
    belongs_to :user, class_name: 'User'
end
