class Like < ApplicationRecord
    belongs_to :book, class_name: 'Book', counter_cache: :likes_count
    belongs_to :user, class_name: 'User'
end
