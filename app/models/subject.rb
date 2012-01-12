class Subject < ActiveRecord::Base

  has_many :tutorials

  validates :name, :description, :uniqueness => true, :presence => true

end
