class User < ApplicationRecord
    has_secure_password
    has_many :likes, class_name: 'Like'
end
