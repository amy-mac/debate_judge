class Contention < ActiveRecord::Base
  attr_accessible :speech_type, :contention, :refuted, :refuted_by

  belongs_to :round
  belongs_to :user

  validates :speech_type, :contention, presence: true

  after_save :update_round
  after_destroy :update_round

  protected
  def update_round
    Round.find(self.round_id).update_attributes(updated_at: Time.now)
  end
end
