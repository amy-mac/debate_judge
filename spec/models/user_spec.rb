require 'spec_helper'

describe User do
  
  context 'valid user entry' do
    it 'has a valid factory' do
      expect(create(:user)).to be_valid
    end

    it 'is a properly formatted email address' do
      expect(build(:user, email: 'test.com')).to have(1).errors_on(:email)
    end

    it 'creates a remember token before saved' do
      user = create(:user)
      expect(user.remember_token).to_not eq(nil)
    end

    it 'sends a welcome email when new user created'

  end

  context 'invalid user entry' do
    it 'is invalid without a name' do
      user = build(:user, name: nil)
      expect(user).to have(1).errors_on(:name)
    end
    
    it 'is invalid without an email' do
      user = build(:invalid_user)
      expect(user).to have(2).errors_on(:email)
    end

    it 'is invalid without a password' do
      user = build(:user, password: nil)
      expect(user).to have(2).errors_on(:password)
    end

    it 'is invalid if password is less than 6 characters' do
      user = build(:user, password: 'foo')
      expect(user).to have(1).errors_on(:password)
    end

    it 'is invalid with a duplicate email address' do
      user = create(:user, email: 'test@test.com')
      user2 = build(:user, email: 'test@test.com')
      expect(user2).to have(1).errors_on(:email)
    end

  end
end
