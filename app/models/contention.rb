class Contention < ActiveRecord::Base
  attr_accessible :speech_type, :contention, :refuted

  validates :speech_type, presence: true
  validates :contention, presence: true
end
