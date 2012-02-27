class AlterDescriptionOnSubjects < ActiveRecord::Migration
  def up
    change_column :subjects, :description, :text
  end
end
