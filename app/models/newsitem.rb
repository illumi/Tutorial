class Newsitem < ActiveRecord::Base
  belongs_to :user
  delegate :first_name, :to => :user, :prefix => true, :allow_nil => true
  
  validates :title, :content, :user_id, :presence => true
end
