class Question < ApplicationRecord
  belongs_to :users

 has_many :questionsanswers
 has_many :answers, through: :questions_answers,
                    dependent: :nullify

 has_many :users_questions_answers_ranks
 has_many :answers, through: :users_questions_answers_ranks,
                    dependent: :nullify
 has_many :ranks, through: :users_questions_answers_ranks,
                    dependent: :nullify

 has_many :comments, as: :commentable,
                    dependent: :destroy
end
