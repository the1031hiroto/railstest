class RoomUser < ApplicationRecord
    belongs_to :roomuser, polymorphic: true
end
