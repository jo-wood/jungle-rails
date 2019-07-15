require 'rails_helper'

RSpec.describe User, type: :model do

  subject {
    described_class.new(:name => 'John', :email => 'email@email.com', :password => 'somepassword', :password_confirmation => 'somepassword') 
  }
  
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
      
  it "is not valid without an name" do
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
