require 'rails_helper'

RSpec.describe User, type: :model do

  subject {
    described_class.new(:name => 'John', :email => 'email@email.com', :password => 'somepassword', :password_confirmation => 'somepassword') 
  }

  describe 'Validations' do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end
        
    it "is not valid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    
    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    
    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end
      
    it "password should contain at least 6 characters" do
      subject.password = 'jack'
      subject.password_confirmation = 'jack'
      expect(subject).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do

    it "has a valid email and password" do
      subject.save
      expect(User.authenticate_with_credentials(subject.email, subject.password)).to eq(subject)
    end

    it "does not have a valid email or password in db" do
      subject.save
      expect(User.authenticate_with_credentials("noEmailInDb@email.com", subject.password)).to_not eq(subject)
    end

    it "emails with case typos will still authenticate" do
      subject.save
      expect(User.authenticate_with_credentials("EMail@email.com", subject.password)).to eq(subject)
    end

  end



end
