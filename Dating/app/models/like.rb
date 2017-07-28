class Like < ApplicationRecord
  belongs_to :like_initiator, foreign_key: :liker_id,
                              class_name: "User"

  belongs_to :like_recipient, foreign_key: :liked_id,
                              class_name: "User"
end
