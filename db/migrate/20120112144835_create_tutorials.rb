class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.string :name
      t.string :description
      t.integer :subject_id

      t.timestamps
    end
  end
end
