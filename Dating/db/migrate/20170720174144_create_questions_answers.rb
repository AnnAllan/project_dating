class CreateQuestionsAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :questions_answers do |t|
      t.integer :question_id
      t.integer :answer_id
      t.timestamps
    end
  end
end
