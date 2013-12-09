class Tournament < ActiveRecord::Base
  attr_accessible :tournament, :school, :date

  validates :tournament, presence: true
  validates :date, presence: true
end
