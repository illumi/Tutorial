class Tutorial < ActiveRecord::Base

  belongs_to :subjects

  validates :name, :description, :uniqueness => true, :presence => true

end
