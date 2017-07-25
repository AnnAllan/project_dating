module QuestionsHelper
  def possible_ans(q_id, answers)
    ans = []
    answers.each do |a|
      if a.question_id.to_i == q_id.to_i
        ans << a
      end
    end
    return ans
  end
end
