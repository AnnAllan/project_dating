class CreateUsersQuestionsAnswersImports < ActiveRecord::Migration[5.0]
  def change
    create_table :users_questions_answers_imports do |t|

      t.timestamps
    end
  end
end
