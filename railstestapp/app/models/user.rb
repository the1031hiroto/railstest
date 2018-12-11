class User < ApplicationRecord
    has_secure_password
    has_many :books, class_name: 'Book'
    has_many :likes, class_name: 'Like'
    has_many :messages, class_name: 'Message'
    has_many :room_users, class_name: 'RoomUser', as: :roomuser
    has_many :rooms, class_name: 'Room', through: :messages
end
