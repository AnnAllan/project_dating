class Score < ApplicationRecord
  has_many :users
  has_many :partner_ids

  def calculate_score
    #for current user find each question that is imperative
      #compare that answer with partner's answer
      # if any not a match, score zero, not displayed
      #



    #if imperative questions not a match, total score 0.  Not displayed
    #else
    #for questions.each do |ques|
      #
  end
end
