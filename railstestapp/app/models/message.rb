class Message < ApplicationRecord
    after_create_commit { MessageBroadcastJob.perform_later self }
    belongs_to :room, class_name: 'Room'
    belongs_to :user, class_name: 'User'
end
