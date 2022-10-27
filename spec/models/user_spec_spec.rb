require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User Validations' do
    before(:each) do
      @user = User.new(name: 'Jarret Coyle',
                       email: 'jarretcoyle@gmail.com',
                       password: 'myPassword',
                       password_confirmation: 'myPassword')
    end

    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    it 'should not be valid without a name' do
      @user.name = nil
      expect(@user).not_to be_valid
    end

    it 'should not be valid without an email' do
      @user.email = nil
      expect(@user).not_to be_valid
    end

    it 'should not be valid if the password does not match the confirmation' do
      @user.password_confirmation = 'notMYpassword'
      expect(@user).not_to be_valid
    end

    it 'should not accept a user with the same email address' do
      @user.save!
      @duplicate_user = User.new(
        name: 'James Coyle',
        email: 'jarretcoyle@gmail.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect { @duplicate_user.save! }.to raise_error(ActiveRecord::RecordInvalid)
      expect(@duplicate_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'should not accept a user with a password less than 8 characters' do
      @user.password = 'jarret'
      @user.password_confirmation = 'jarret'
      expect(@user).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    before(:each) do
      @user = User.new(name: 'Jarret Coyle',
                       email: 'jarretcoyle@gmail.com',
                       password: 'myPassword',
                       password_confirmation: 'myPassword')
      @user.save!
    end
    it 'should log a user in with valid credentials' do
      login = User.authenticate_with_credentials('jarretcoyle@gmail.com', 'myPassword')
      expect(login).to eq(@user)
    end

    it 'should not log user in with invalid password' do
      login = User.authenticate_with_credentials('jarretcoyle@gmail.com', 'incPassword')
      expect(login).not_to eq(@user)
    end

    it 'should not log user in with invalid email' do
      login = User.authenticate_with_credentials('jarrecoyle@gmail.com', 'myPassword')
      expect(login).not_to eq(@user)
    end

    it 'should accept an email address with white space before and/or after' do
      login = User.authenticate_with_credentials('  jarretcoyle@gmail.com  ', 'myPassword')
      expect(login).to eq(@user)
    end

    it 'should accept an email address regardless of case' do
      login = User.authenticate_with_credentials('JARRETCOYLE@GMAIL.COM', 'myPassword')
      expect(login).to eq(@user)
    end

    it 'should return nil when password and email are not found' do
      login = User.authenticate_with_credentials('jarretcoyle@hotmail.com', 'notMyPassword')
      expect(login).to be_nil
    end
  end
end