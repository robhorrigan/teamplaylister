require 'spec_helper'
 
describe Song do
  it "has a valid factory" do
  	FactoryGirl.create(:song).should be_valid
	end
