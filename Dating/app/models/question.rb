class Question < ApplicationRecord
  belongs_to :users

  has_many :users_questions_answers_imports
  has_many :answers, thorugh: :users_questions_answers_imports,
                     dependent: :nullify
  has_many :imports, through: :users_questions_answers_imports,
                     dependent: :nullify
end
