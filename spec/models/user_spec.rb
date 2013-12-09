require 'spec_helper'

describe User do
  
  context 'valid user entry' do
    it 'has a valid factory' do
      expect(create(:user)).to be_valid
    end

    it 'is a properly formatted email address'

    it 'creates a remember token before saved'

    it 'converts email to downcase before saved'

    it 'sends a welcome email when new user created'

  end

  context 'invalid user entry' do
    it 'is invalid without an email'

    it 'is invalid without a password'

    it 'is invalid if password is less than 6 characters'

    it 'is invalid with a duplicate email address'

  end
end
