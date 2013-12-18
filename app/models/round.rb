class Round < ActiveRecord::Base
  attr_accessible :round_num, :event

  belongs_to :tournament
  belongs_to :user
  has_many :contentions, dependent: :destroy

  validates :round_num, presence: true
  validates_uniqueness_of :round_num, :scope => [:event, :tournament_id]
  validates :event, presence: true
end
