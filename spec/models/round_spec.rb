require 'spec_helper'

describe Round do
  context 'valid round entry' do
    it 'has a valid factory' do
      expect(create(:round)).to be_valid
    end

    it 'is assigned to a user'

  end

  context 'invalid round entry' do
    it 'is invalid without a round number' do
      round = build(:round, round_num: nil)
      expect(round).to have(1).errors_on(:round_num)
    end

    it 'is invalid without an event' do
      round = build(:round, event: nil)
      expect(round).to have(1).errors_on(:event)
    end

    it 'is invalid if duplicate entry'
  end
end
