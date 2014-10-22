require 'spec_helper'
 
describe User do
  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
  end
  it "is invalid without a uid" do
    FactoryGirl.build(:user, uid: nil).should_not be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:user, name: nil).should_not be_valid
  end
  it "is invalid without a token" do
    FactoryGirl.build(:user, token: nil).should_not be_valid
  end
  it "is invalid without a refresh token" do
    FactoryGirl.build(:user, refresh_token: nil).should_not be_valid
  end
  it "returns a user's uid as a string" do
    user = FactoryGirl.create(:user, :uid)
    user.uid.should == user.uid 
  end
  it "returns a user's name as a string" do
    user = FactoryGirl.create(:user, :name)
    user.name.should == user.name
  end
  it "returns a user's token as a string" do
    user = FactoryGirl.create(:user, :token)
    user.token.should == user.token
  end
  it "returns a user's refresh token as a string" do
    user = FactoryGirl.create(:user, :refresh_token)
    user.refresh_token.should == user.refresh_token
  end
end