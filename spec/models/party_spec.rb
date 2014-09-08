require 'spec_helper'
 
describe Party do
  it "has a valid factory" do
  	FactoryGirl.create(:party).should be_valid
	end

	it "is invalid without a uid" do
    FactoryGirl.build(:user, uid: nil).should_not be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:user, name: nil).should_not be_valid
  end

end
