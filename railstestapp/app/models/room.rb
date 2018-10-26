class Room < ApplicationRecord
    has_many :messages, class_name: 'Message'
    has_many :users, class_name: 'User'
    has_many :room_users, class_name: 'RoomUser', as: :roomuser
    accepts_nested_attributes_for :messages
end
