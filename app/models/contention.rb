class Contention < ActiveRecord::Base
  attr_accessible :speech_type, :contention, :refuted, :refuted_by

  belongs_to :round
  belongs_to :user

  validates :speech_type, presence: true
  validates :contention, presence: true
end
