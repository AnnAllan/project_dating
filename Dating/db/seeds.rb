# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
puts "Destroying old records..."
User.destroy_all
Address.destroy_all
Question.destroy_all
Answer.destroy_all
Comment.destroy_all
Import.destroy_all
Like.destroy_all
Score.destroy_all
puts "Old records destroyed"

puts "Creating 20 users..."
20.times do |i|
  User.create(first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              user_name: Faker::Internet.unique.user_name,
              email: Faker::Internet.unique.email,
              phone: Faker::PhoneNumber.phone_number,
              credit_card: Faker::Business.credit_card_number,
              gender_identity: Faker::Number.between(1, 3),
              bio: Faker::HitchhikersGuideToTheGalaxy.quote,
              home_address: i + 1,
              billing_address: i + 21)
end
puts "20 Users created."

puts "Creating 40 addresses..."
def address_generator(billing)
  Address.create(street_address: Faker::Address.street_address,
                 secondary_address: Faker::Address.secondary_address,
                 city: Faker::Address.city,
                 state_abbr: Faker::Address.state_abbr,
                 zip: Faker::Address.zip,
                 billing_address: billing )
end
20.times do
  address_generator(true)
  address_generator(false)
end
puts "40 addresses created."


puts "Creating 7 questions..."
questions_content = ["What gender would you prefer to pursue?", "What is your ideal weekend activity?", "What is your favorite food?", "Who is your favorite fictional character?", "Are you a smoker?", "Do you have/want children?", "Do you have/want pets?"]
7.times do |i|
  Question.create(content: questions_content[i],
                  user_id: 1)
end
puts "Created 7 questions."


puts "Creating Answers..."
answers_content = ["male", "female", "no preference", "camping", "Netflix", "reading", "partying", "pizza", "steak", "lobster", "pasta", "Sherlock Holmes", "The Doctor", "Superman", "Mickey Mouse", "yes", "no", "yes", "no", "yes", "no"]
(answers_content.count).times do |i|
  Answer.create(content: answers_content[i])
end
puts "Answers created."


puts "Creating Comments..."
def generate_comment(commentable_type, commentable_id, user_id)
  Comment.create(message: Faker::FamilyGuy.quote,
                 commentable_type: commentable_type,
                 commentable_id: commentable_id,
                 user_id: user_id)
end
5.times do |i|
  generate_comment("User", i + 1, i + 3)
  generate_comment("Question", i + 1, i + 3)
  generate_comment("Comment", i + 1, i + 3)
end

puts "Creating imports..."
import_names = ["Not important", "Somewhat important", "Very important", "Imperative"]
(import_names.count).times do |i|
  Import.create(name: import_names[i],
                value: i + 1)
end
puts "Imports created."

puts "Creating Likes..."
10.times do |i|
  Like.create(liker_id: i + 2,
               liked_id: i + 3)
end
puts "Likes created."

puts "Creating user answers and question rankings..."
def generate_answer(j)
  if j == 1
    ans = rand(1..3)
  elsif j <= 4
    ans = rand(1..4)
  else
    ans = rand(1..2)
  end
  return ans
end

def generate_import(j)
  if j == 1
    imp = 4
  else
    imp = rand(1..4)
  end
  return imp
end

20.times do |i|
  7.times do |j|
  UsersQuestionsAnswersImport.create(user_id: i + 1,
                                    question_id: j + 1,
                                    answer_id: generate_answer(j + 1),
                                    import_id: generate_import(j + 1))
  end
end
puts "User answers and question rankings created."

puts "Creating questions possible answers..."
def generate_question_id(a)
  case a
  when 1, 2, 3
    question_id = 1
  when 4, 5, 6, 7
    question_id = 2
  when 8, 9, 10, 11
    question_id = 3
  when 12, 13, 14, 15
    question_id = 4
  when 16, 17
    question_id = 5
  when 18, 19
    question_id = 6
  else
    question_id = 7
  end
end
(answers_content.count).times do |i|
  a = i + 1
  QuestionsPossibleAnswer.create(answer_id: a,
                                  question_id: generate_question_id(a))
end
puts "Question and possible answers created."
