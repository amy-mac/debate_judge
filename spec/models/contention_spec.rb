require 'spec_helper'

describe Contention do
  describe 'valid entry of contention' do
    it 'has a valid factory' do
      round = create(:round)
      expect(round.contentions.create(:contention)).to be_valid
    end

    it 'is assigned to a round' do
      round = create(:round)
      contention = round.contentions.create(:contention)
      expect(contention.round_id).to eq(round.id)
    end

    it 'updates Round updated_at'

  end

  describe 'invalid entry of contention' do
    it 'is invalid without a speech_type' do
      contention = build(:contention, speech_type: nil)
      expect(contention).to have(1).errors_on(:speech_type)
    end

    it 'is invalid without a contention' do
      contention = build(:contention, contention: nil)
      expect(contention).to have(1).errors_on(:contention)
    end
  end
end
