class CreateUsersQuestionsAnswersRanks < ActiveRecord::Migration[5.0]
  def change
    create_table :users_questions_answers_ranks do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :answer_id
      t.integer :rank_id

      t.timestamps
    end
  end
end
