class Round < ActiveRecord::Base
  attr_accessible :round_num, :event, :notes

  belongs_to :tournament
  belongs_to :user
  has_many :contentions, dependent: :destroy

  validates :round_num, :event, presence: true
  validates_uniqueness_of :round_num, :scope => [:event, :tournament_id]

end
