require 'spec_helper'
 
describe Party do
  it "has a valid factory" do
  	FactoryGirl.create(:party).should be_valid
	end
	it "is invalid without a name" do
    FactoryGirl.build(:party, name: nil).should_not be_valid
  end
	it "is invalid without a code" do
    FactoryGirl.build(:party, code: nil).should_not be_valid
  end
  it "is invalid without a user_id" do
    FactoryGirl.build(:party, user_id: nil).should_not be_valid
  end
   it "is invalid without a spotify_playlist_id" do
    FactoryGirl.build(:party, spotify_playlist_id: nil).should_not be_valid
  end

  it "can have songs added to party" do
  	pending
	end

	it "can send text with party code" do
		pending
	end
end
