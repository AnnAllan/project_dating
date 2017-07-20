class QuestionsAnswer < ApplicationRecord
  belongs_to :questions
  belongs_to :answers
end
