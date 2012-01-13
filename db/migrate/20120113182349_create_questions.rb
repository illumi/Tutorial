class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.string :answer
      t.string :hint
      t.integer :tutorial_id

      t.timestamps
    end
  end
end
