class Import < ApplicationRecord
  belongs_to :users
  belongs_to :answers

  has_many :users_questions_answers_imports
  has_many :questions, through: :users_questions_answers_imports,
                     dependent: :nullify

end
