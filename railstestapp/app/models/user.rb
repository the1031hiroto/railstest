class User < ApplicationRecord
    has_secure_password
    has_many :books, class_name: 'Book'
    has_many :likes, class_name: 'Like'
end
