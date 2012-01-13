class UserAnswer < ActiveRecord::Base
  
  belongs_to :questions
  belongs_to :users
  
end
