class Tournament < ActiveRecord::Base
  attr_accessible :tournament, :school, :date

  belongs_to :user
  has_many :rounds

  validates :tournament, presence: true
  validates :date, presence: true
end
