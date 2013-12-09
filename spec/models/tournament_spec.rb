require 'spec_helper'

describe Tournament do
  
  context 'valid tournament entry' do
    it 'has a valid factory' do
      expect(create(:tournament)).to be_valid
    end

    it 'has a valid date'

  end

  context 'invalid tournament entry' do
    it 'is invalid without a tournament' do
      tourney = build(:invalid_tournament)
      expect(tourney).to have(1).errors_on(:tournament)
    end

    it 'is invalid without a date' do
      tourney = build(:tournament, date: nil)
      expect(tourney).to have(1).errors_on(:date)
    end
  end
end
