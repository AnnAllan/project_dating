class Answer < ApplicationRecord
  belongs_to :question

  has_many :questions_answers
  has_many :questions, through: :questions_answers

  has_many :users_questions_answers_ranks
  has_many :ranks, through: :users_questions_answers_ranks,
                     dependent: :nullify

end
