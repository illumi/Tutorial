class DropTableWebsite < ActiveRecord::Migration
  def up
    drop_table :websites
  end
end
