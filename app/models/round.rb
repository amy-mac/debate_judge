class Round < ActiveRecord::Base
  attr_accessible :round_num, :event

  belongs_to :tournament
  belongs_to :user
  has_many :contentions

  validates :round_num, presence: true
  validates :event, presence: true
end
