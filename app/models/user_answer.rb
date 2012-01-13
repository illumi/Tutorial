class UserAnswer < ActiveRecord::Base
  
  belongs_to :questions
  belongs_to :users
  
  validates :answer, :presence => true
  
end
