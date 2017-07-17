class CreateUsersQuestionsAnswersImports < ActiveRecord::Migration[5.0]
  def change
    create_table :users_questions_answers_imports do |t|
      t.integer :user_id, null:false
      t.integer :question_id, null: false
      t.integer :answer_id, null: false
      t.integer :import_id, null: false

      t.index :user_id
      t.index :question_id
      t.index :answer_id
      t.index :import_id

      t.timestamps
    end
  end
end
