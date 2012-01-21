class RemoveOldForeignKeyFromSubject < ActiveRecord::Migration
  def up
    remove_column :subjects, :website_id
      end

  def down
    add_column :subjects, :website_id, :integer
  end
end
