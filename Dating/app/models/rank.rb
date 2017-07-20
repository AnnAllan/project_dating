class Rank < ApplicationRecord
 belongs_to :users
 belongs_to :answers

 has_many :users_questions_answers_ranks
 has_many :questions, through: :users_questions_answers_ranks,
                    dependent: :nullify

end
