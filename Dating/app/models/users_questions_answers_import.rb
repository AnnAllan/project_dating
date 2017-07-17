class UsersQuestionsAnswersImport < ApplicationRecord
  belongs_to :users
  belongs_to :questions
  belongs_to :answers
  belongs_to :imports
end
