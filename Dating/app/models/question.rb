class Question < ApplicationRecord
  belongs_to :users

 has_many :questions_possible_answers
 has_many :answers, through: :questions_possible_answers,
                    dependent: :nullify

 has_many :users_questions_answers_imports
 has_many :answers, through: :users_questions_answers_imports,
                    dependent: :nullify
 has_many :imports, through: :users_questions_answers_imports,
                    dependent: :nullify

 has_many :comments, as: :commentable,
                    dependent: :destroy
end
