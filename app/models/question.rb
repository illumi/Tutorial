class Question < ActiveRecord::Base

  belongs_to :tutorials
  has_many :user_answers

  validates :name, :answer, :hint, :presence => true

end
