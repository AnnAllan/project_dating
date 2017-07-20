class Answer < ApplicationRecord belongs_to :users
  belongs_to :questions

  has_many :questions_possible_answers
  has_many :questions, through: :questions_possible_answers

  has_many :users_questions_answers_imports
  has_many :imports, through: :users_questions_answers_imports,
                     dependent: :nullify

end
