module UsersHelper
  def gender_name(int)
    if int == 1
      return "Male"
    elsif int == 2
      return "Female"
    else
      return "Prefer not to answer"
    end
  end

  def same_person(user_id, partner_id)
    return user_id == partner_id
  end

  def person_answer(uqar, q, person)
    if uqar.question_id == q && uqar.user_id == person
      return uqar.answer_id
    end
  end

  def imperative_fail(user_id, partner_id)
    user_answer = 0
    partner_answer = 0
    match_fail = false
    UsersQuestionsAnswersRank.find_each do |uqar|
      if uqar.user_id == user_id && uqar.rank_id == 4
        user_answer = person_answer(uqar,uqar.question_id, user_id)
        if uqar.user_id == partner_id
          partner_answer = person_answer(uqar, uqar.question_id, partner_id)
          if user_answer != partner_answer
            match_fail = true
            return match_fail
          end
        end
      end
    end
    return match_fail
  end

  def tally_question_score(uqar, user_id, partner_id, question_id)
    user_answer = person_answer(uqar, question_id, user_id)
    partner_answer = person_answer(uqar, question_id, partner_id)
    user_rank = uqar.rank_id
    if user_answer != partner_answer
      return 0
    else
      return user_rank
    end
  end

  def calculate_score(user_id, partner_id)
    total_score = 0
    if same_person(user_id, partner_id)
      return 0
    elsif imperative_fail(user_id, partner_id)
      return 0
    else
      UsersQuestionsAnswersRank.find_each do |uqar|
        total_score += tally_question_score(uqar, user_id, partner_id, uqar.question_id)
      end
    end
    return total_score
  end

  def partner_score(current_user, partner)
    Score.find_each do |s|
      if s.user_id == current_user.id && s.partner_id == partner.id
        return s.score
      end
    end
  end

  def partner_likes(current_user, partner)
    curr_user_likes = []
    partner_likes = []
    Like.find_each do |l|
      if l.liker_id == current_user.id
        curr_user_likes << l.liked_id
      end
      if l.liker_id == partner.id
        partner_likes << l.liked_id
      end
    end
    if (curr_user_likes.include?(partner.id)) && (partner_likes.include?(current_user.id))
      return true
    else
      return false
    end
  end

  def partner_degrees(current_user, partner)
    matchers = [current_user]
    previous_matchers = []
    temp_matchers = []
    connection = false
    i = 1
    while !connection do
      matchers.each do |x|
        connection = partner_likes(x, partner)
        break if connection
      end
      matchers.each do |y|
        User.find_each do |u|
          temp_matchers << u if partner_likes(y, u)
        end
      end
      break if temp_matchers.empty?
      matchers.each do |a|
        previous_matchers << a
      end
      matchers.clear
      old_matchers = previous_matchers & temp_matchers
      old_matchers.each do |b|
        temp_matchers.delete(b)
      end
      break if temp_matchers.empty?
      temp_matchers.each do |z|
        matchers << z
      end
      temp_matchers.clear
      i += 1
    end
    if connection
      return i
    else
      return "No connection"
    end
  end
end
