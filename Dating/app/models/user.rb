class User < ApplicationRecord
  has_many :addresses, dependent: :destroy

  has_many :questions

  has_many :users_questions_answers_imports
  has_many :answers, thorugh: :users_questions_answers_imports,
                     dependent: :nullify
  has_many :imports, through: :users_questions_answers_imports,
                     dependent: :nullify

  has_many :initiated_likes, foreign_key: :liker_id,
                             class_name: "Likes",
                             dependent: :nullify
  has_many :liked_users,     through: :initiated_likes,
                             source: :like_recipient

  has_many :received_likes,  foreign_key: :liked_id,
                             class_name: "Likes",
                             dependent: :nullify
  has_many :users_liked_by,  through: :received_likes,
                             source: :like_initiator

  has_many :comments, as: :commentable,
                      dependent: :destroy

  has_many :scores
end
