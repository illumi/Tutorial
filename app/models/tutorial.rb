class Tutorial < ActiveRecord::Base

  belongs_to :subjects
  has_many :questions

  validates :name, :uniqueness => true, :presence => true
  validates :description, :presence => true

end
