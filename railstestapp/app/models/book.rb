class Book < ApplicationRecord
    belongs_to :user, class_name: 'User'
    has_many :likes, class_name: 'Like'
end
