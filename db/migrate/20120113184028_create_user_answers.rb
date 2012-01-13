class CreateUserAnswers < ActiveRecord::Migration
  def change
    create_table :user_answers do |t|
      t.string :answer
      t.integer :question_id
      t.integer :user_id

      t.timestamps
    end
  end
end
