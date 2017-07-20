class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :content
      t.string :user_id, default: 0

      t.timestamps
    end
  end
end
