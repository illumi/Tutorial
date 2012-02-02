class Newsitem < ActiveRecord::Base
  belongs_to :users
  delegate :first_name, :to => :user, :prefix => true, :allow_nil => true
  
  validates :title, :content, :presence => true
end